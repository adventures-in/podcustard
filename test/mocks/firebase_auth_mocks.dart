import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

class FakeFirebaseAuthPeriodic extends Fake implements FirebaseAuth {
  @override
  Stream<FirebaseUser> get onAuthStateChanged =>
      Stream.periodic(Duration(seconds: 1), (tickNum) {
        if (tickNum > 1) tickNum = 1;
        return [FakeFirebaseUserNull(), FakeFirebaseUser()].elementAt(tickNum);
      });
}

class FakeFirebaseAuth1 extends Fake implements FirebaseAuth {
  @override
  Stream<FirebaseUser> get onAuthStateChanged =>
      Stream.fromIterable([FakeFirebaseUserNull(), FakeFirebaseUser()]);

  @override
  Future<AuthResult> signInWithCredential(AuthCredential credential) =>
      Future.value(FakeAuthResult());
}

class FakeFirebaseAuthOpen extends Fake implements FirebaseAuth {
  final controller = StreamController<FirebaseUser>();

  @override
  Stream<FirebaseUser> get onAuthStateChanged => controller.stream;

  void add(FirebaseUser user) => controller.add(user);

  void close() {
    controller.close();
  }
}

class FakeFirebaseUserNull extends Fake implements FirebaseUser {
  @override
  String get uid => null;
  @override
  String get displayName => null;
  @override
  String get email => null;
  @override
  String get photoUrl => null;

  @override
  List<UserInfo> providerData;
}

class FakeFirebaseUser extends Fake implements FirebaseUser {
  @override
  String get uid => 'uid';
  @override
  String get displayName => 'name';
  @override
  String get email => 'email';
  @override
  String get photoUrl => 'url';

  @override
  List<UserInfo> providerData = [];
}

class FakeAuthResult extends Fake implements AuthResult {
  /// Returns the currently signed-in [FirebaseUser], or `null` if there isn't
  /// any (i.e. the user is signed out).
  @override
  final FirebaseUser user = FakeFirebaseUser();
}
