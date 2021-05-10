import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

class FakeFirebaseAuthPeriodic extends Fake implements auth.FirebaseAuth {
  @override
  Stream<auth.User?> authStateChanges() =>
      Stream.periodic(Duration(seconds: 1), (tickNum) {
        if (tickNum > 1) tickNum = 1;
        return [null, FakeFirebaseUser()].elementAt(tickNum);
      });
}

class FakeFirebaseAuth1 extends Fake implements auth.FirebaseAuth {
  @override
  Stream<auth.User?> authStateChanges() =>
      Stream.fromIterable([null, FakeFirebaseUser()]);

  @override
  Future<UserCredential> signInWithCredential(auth.AuthCredential credential) =>
      Future.value(FakeUserCredential());
}

class FakeFirebaseAuthOpen extends Fake implements FirebaseAuth {
  final controller = StreamController<auth.User?>();

  @override
  Stream<auth.User?> authStateChanges() => controller.stream;

  void add(auth.User? user) => controller.add(user);

  void close() {
    controller.close();
  }
}

class FakeFirebaseUser extends Fake implements auth.User {
  @override
  String get uid => 'uid';
  @override
  String get displayName => 'name';
  @override
  String get email => 'email';
  @override
  String get photoURL => 'url';

  @override
  List<UserInfo> providerData = [];
}

class FakeUserCredential extends Fake implements auth.UserCredential {}
