import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:podcustard/actions/add_problem_action.dart';
import 'package:podcustard/actions/redux_action.dart';
import 'package:podcustard/actions/store_auth_step_action.dart';
import 'package:podcustard/actions/store_user_action.dart';
import 'package:podcustard/extensions/extensions.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/utils/apple_signin_object.dart';

class AuthService {
  AuthService(this._fireAuth, this._googleSignIn, this._appleSignIn);

  final FirebaseAuth _fireAuth;
  final GoogleSignIn _googleSignIn;
  final AppleSignInObject _appleSignIn;

  // Map FirebaseUser objects emitted by FirebaseAuth to a StoreUser action,
  // which can be dispatched by the store.
  // If the FirebaseUser or the uid field is null, create an empty StoreUser
  // object that will set the user field of the AppState to null.
  Stream<ReduxAction> get streamOfStateChanges {
    return _fireAuth
        .authStateChanges()
        .map((user) => StoreUserAction(user?.toModel()));
  }

  Stream<ReduxAction> get googleSignInStream async* {
    // signal to change UI
    yield StoreAuthStepAction(1);

    try {
      final googleUser = await _googleSignIn.signIn();

      // if the user canceled signin, an error is thrown but it gets swallowed
      // by the signIn() method so we need to reset the UI and close the stream
      if (googleUser == null) {
        yield StoreAuthStepAction(0);
        return;
      }

      // signal to change UI
      yield StoreAuthStepAction(2);

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      /// the auth info will be picked up by the listener on [onAuthStateChanged]
      /// and emitted by [streamOfStateChanges]
      await _fireAuth.signInWithCredential(credential);

      // we are signed in so reset the UI
      yield StoreAuthStepAction(0);
    } catch (error, trace) {
      // reset the UI and display an alert

      yield StoreAuthStepAction(0);
      // errors with code kSignInCanceledError are swallowed by the
      // GoogleSignIn.signIn() method so we can assume anything caught here
      // is a problem and send to the store for display
      yield AddProblemAction(
          Problem(message: error.toString(), trace: trace.toString()));
    }
  }

  Stream<ReduxAction> get appleSignInStream async* {
    // signal to change UI
    yield StoreAuthStepAction(1);

    try {
      final result = await _appleSignIn.startAuth();

      switch (result.status) {
        case AuthorizationStatus.authorized:
          // signal to change UI
          yield StoreAuthStepAction(2);

          // retrieve the apple credential and convert to oauth credential
          final appleIdCredential = result.credential;
          final oAuthProvider = OAuthProvider('apple.com');
          final credential = oAuthProvider.credential(
            idToken: String.fromCharCodes(appleIdCredential.identityToken),
            accessToken:
                String.fromCharCodes(appleIdCredential.authorizationCode),
          );

          // use the credential to sign in to firebase
          await FirebaseAuth.instance.signInWithCredential(credential);
          break;
        case AuthorizationStatus.error:
          throw result.error;

        case AuthorizationStatus.cancelled:
          yield StoreAuthStepAction(0);
          break;
      }
    } catch (error, trace) {
      // reset the UI and display an alert

      yield StoreAuthStepAction(0);
      // any specific errors are caught and dealt with so we can assume
      // anything caught here is a problem and send to the store for display
      yield AddProblemAction(
          Problem(message: error.toString(), trace: trace.toString()));
    }
  }
}
