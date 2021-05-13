import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:mockito/mockito.dart';
import 'package:podcustard/utils/apple_signin_object.dart';

class FakeAppleSignIn extends Fake implements AppleSignInObject {
  @override
  Future<AuthorizationResult> startAuth() {
    final result = AuthorizationResult(
        status: AuthorizationStatus.authorized,
        credential: AppleIdCredential(),
        error: null);
    return Future.value(result);
  }
}

// When the user cancels during the signin process, the Future returned
// by startAuth has cancelled status
class FakeAppleSignInCancels extends Fake implements AppleSignInObject {
  @override
  Future<AuthorizationResult> startAuth() {
    final result = AuthorizationResult(
        status: AuthorizationStatus.cancelled,
        credential: AppleIdCredential(),
        error: null);
    return Future.value(result);
  }
}

class FakeAppleSignInThrows extends Fake implements AppleSignInObject {
  @override
  Future<AuthorizationResult> startAuth() {
    throw Exception('AppleSignIn.signIn');
  }
}
