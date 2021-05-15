import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:podcustard/actions/add_problem_action.dart';
import 'package:podcustard/actions/redux_action.dart';
import 'package:podcustard/actions/store_auth_step_action.dart';
import 'package:podcustard/actions/store_user_action.dart';
import 'package:podcustard/extensions/extensions.dart';
import 'package:podcustard/models/auth/apple_id_credential.dart';
import 'package:podcustard/models/auth/auth_user_data.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/services/wrappers/apple_signin_wrapper.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  AuthService(this._fireAuth, this._googleSignIn, this._appleSignIn);

  final FirebaseAuth _fireAuth;
  final GoogleSignIn _googleSignIn;
  final AppleSignInWrapper _appleSignInWrapper;

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

  Future<AppleIdCredential> getAppleCredential() async {
    final appleIdCredential =
        await SignInWithApple.getAppleIDCredential(scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ]);

    return appleIdCredential.toModel();
  }

  Future<AuthUserData> signInWithApple(
      {required AppleIdCredential credential}) async {
    // convert to OAuthCredential
    final oAuthCredential = OAuthProvider('apple.com').credential(
      idToken: credential.identityToken,
      accessToken: credential.authorizationCode,
    );

    // use the credential to sign in to firebase
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
    // not sure why user would be null (docs don't say) so we throw if it is
    final user = userCredential.user!;
    return user.toModel();
  }
}
