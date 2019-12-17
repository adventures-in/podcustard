import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

class FakeFirebaseAuthPeriodic extends Fake implements FirebaseAuth {
  @override
  Stream<FirebaseUser> get onAuthStateChanged =>
      Stream.periodic(Duration(seconds: 1), (num) {
        if (num > 1) num = 1;
        return [FakeFirebaseUserNull(), FakeFirebaseUserBlah()].elementAt(num);
      });
}

class FakeFirebaseAuth1 extends Fake implements FirebaseAuth {
  @override
  Stream<FirebaseUser> get onAuthStateChanged =>
      Stream.fromIterable([FakeFirebaseUserNull(), FakeFirebaseUserBlah()]);
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
}

class FakeFirebaseUserBlah extends Fake implements FirebaseUser {
  @override
  String get uid => 'blah';
}

class Mocks {
  static fakeFirebaseAuth1() => FakeFirebaseAuth1();
  static fakeFirebaseAuthOpen() => FakeFirebaseAuthOpen();
}
