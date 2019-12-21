import 'mock_firebase_auth.dart';
import 'mock_google_signin.dart';

class Mocks {
  static FakeFirebaseAuth1 fakeFirebaseAuth1() => FakeFirebaseAuth1();
  static FakeFirebaseAuthOpen fakeFirebaseAuthOpen() => FakeFirebaseAuthOpen();
  static FakeGoogleSignInCancels fakeGoogleSignInCancels() =>
      FakeGoogleSignInCancels();
  static FakeGoogleSignInThrows fakeGoogleSignInThrows() =>
      FakeGoogleSignInThrows();
  static FakeGoogleSignIn fakeGoogleSignIn() => FakeGoogleSignIn();
}
