import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:built_collection/built_collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/models/provider_info.dart';
import 'package:podcustard/models/user.dart';
import 'package:podcustard/models/actions.dart';
import 'package:podcustard/utils/apple_signin_object.dart';

class AuthService {
  AuthService(this._fireAuth, this._googleSignIn, this._appleSignIn);

  final FirebaseAuth _fireAuth;
  final GoogleSignIn _googleSignIn;
  final AppleSignInObject _appleSignIn;

  // map the emitted FirebaseUsers to StoreAuthState actions
  // if FirebaseUser is null, map to a StoreAuthState with null uid
  Stream<Action> get streamOfStateChanges {
    return _fireAuth.onAuthStateChanged.map(
      (FirebaseUser fireUser) => Action.StoreUser(
        user: (fireUser == null || fireUser.uid == null)
            ? null
            : User(
                (b) => b
                  ..uid = fireUser.uid
                  ..displayName = fireUser.displayName ?? 'No name'
                  ..email = fireUser.email ?? 'noemail'
                  ..photoUrl = fireUser.photoUrl ?? 'default'
                  ..providers = (fireUser.providerData == null)
                      ? ListBuilder()
                      : ListBuilder(
                          fireUser.providerData.map<ProviderInfo>(
                            (provider) => ProviderInfo((b) => b
                              ..displayName = provider.displayName
                              ..email = provider.email
                              ..phoneNumber = provider.phoneNumber
                              ..photoUrl = provider.photoUrl
                              ..providerId = provider.providerId
                              ..uid = provider.uid),
                          ),
                        ),
              ),
      ),
    );
  }

  Stream<Action> get googleSignInStream async* {
    // signal to change UI
    yield Action.StoreAuthStep(step: 1);

    try {
      final googleUser = await _googleSignIn.signIn();

      // if the user canceled signin, an error is thrown but it gets swallowed
      // by the signIn() method so we need to reset the UI and close the stream
      if (googleUser == null) {
        yield Action.StoreAuthStep(step: 0);
        return;
      }

      // signal to change UI
      yield Action.StoreAuthStep(step: 2);

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      /// the auth info will be picked up by the listener on [onAuthStateChanged]
      /// and emitted by [streamOfStateChanges]
      await _fireAuth.signInWithCredential(credential);

      // we are signed in so reset the UI
      yield Action.StoreAuthStep(step: 0);
    } catch (error, trace) {
      // reset the UI and display an alert

      yield Action.StoreAuthStep(step: 0);
      // errors with code kSignInCanceledError are swallowed by the
      // GoogleSignIn.signIn() method so we can assume anything caught here
      // is a problem and send to the store for display
      yield Action.AddProblem(
          problem: Problem((b) => b
            ..message = error.toString()
            ..trace = trace.toString()
            ..type = ProblemTypeEnum.googleSignin));
    }
  }

  Stream<Action> get appleSignInStream async* {
    // signal to change UI
    yield Action.StoreAuthStep(step: 1);

    try {
      final result = await _appleSignIn.startAuth();

      switch (result.status) {
        case AuthorizationStatus.authorized:
          // signal to change UI
          yield Action.StoreAuthStep(step: 2);

          // retrieve the apple credential and convert to oauth credential
          final appleIdCredential = result.credential;
          final oAuthProvider = OAuthProvider(providerId: 'apple.com');
          final credential = oAuthProvider.getCredential(
            idToken: String.fromCharCodes(appleIdCredential.identityToken),
            accessToken:
                String.fromCharCodes(appleIdCredential.authorizationCode),
          );

          // use the credential to sign in to firebase
          await FirebaseAuth.instance.signInWithCredential(credential);
          break;
        case AuthorizationStatus.error:
          throw result.error;
          break;

        case AuthorizationStatus.cancelled:
          yield Action.StoreAuthStep(step: 0);
          break;
      }
    } catch (error, trace) {
      // reset the UI and display an alert

      yield Action.StoreAuthStep(step: 0);
      // any specific errors are caught and dealt with so we can assume
      // anything caught here is a problem and send to the store for display
      yield Action.AddProblem(
        problem: Problem((b) => b
          ..message = error.toString()
          ..trace = trace.toString()
          ..type = ProblemTypeEnum.appleSignin),
      );
    }
  }
}
