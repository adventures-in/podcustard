import 'package:built_collection/built_collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/models/provider_info.dart';
import 'package:podcustard/models/user.dart';
import 'package:podcustard/redux/actions.dart';

class AuthService {
  AuthService(this._fireAuth, this._googleSignIn);

  final FirebaseAuth _fireAuth;
  final GoogleSignIn _googleSignIn;

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
    try {
      yield Action.StoreAuthStep(step: 1);

      final googleUser = await _googleSignIn.signIn();

      // if the user canceled signin, an error is thrown but it gets swallowed
      // by the signIn() method so we need to reset the UI and close the stream
      if (googleUser == null) {
        yield Action.StoreAuthStep(step: 0);
        return;
      }

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
            ..type = ProblemTypeEnum.signin));
    }
  }
}
