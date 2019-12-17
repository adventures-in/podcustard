import 'package:firebase_auth/firebase_auth.dart';
import 'package:podcustard/redux/actions.dart';

class AuthService {
  AuthService(this.fireAuth);

  final FirebaseAuth fireAuth;

  // map the emitted FirebaseUsers to StoreAuthState actions
  // if FirebaseUser is null, map to a StoreAuthState with null uid
  Stream<Action> get streamOfStateChanges {
    return fireAuth.onAuthStateChanged.map((fireUser) => Action.StoreAuthState(
        userId: (fireUser == null) ? null : fireUser.uid));
  }
}
