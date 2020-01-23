import 'package:apple_sign_in/apple_sign_in.dart';

class AppleSignInObject {
  Future<AuthorizationResult> startAuth() {
    return AppleSignIn.performRequests([
      AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);
  }
}
