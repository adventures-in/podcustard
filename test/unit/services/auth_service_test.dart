import 'package:podcustard/redux/actions.dart';
import 'package:podcustard/services/auth_service.dart';
import 'package:test/test.dart';

import '../../mocks/mock_firebase_auth.dart';

void main() {
  group("Auth Service", () {
    // has a method that returns a stream that emits user

    test("provides a stream of auth state", () {
      final service = AuthService(Mocks.fakeFirebaseAuth1());

      service.streamOfStateChanges.listen(expectAsync1((action) {
        expect(action is StoreAuthState, true);
      }, count: 2));
    });
  });
}
