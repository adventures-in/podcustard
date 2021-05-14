import 'package:podcustard/actions/add_problem_action.dart';
import 'package:podcustard/actions/store_auth_step_action.dart';
import 'package:podcustard/actions/store_user_action.dart';
import 'package:podcustard/services/auth_service.dart';
import 'package:test/test.dart';

import '../../test-doubles/plugins/apple_signin_mocks.dart';
import '../../test-doubles/plugins/firebase_auth_mocks.dart';
import '../../test-doubles/plugins/google_signin_mocks.dart';

void main() {
  group('Auth Service', () {
    // has a method that returns a stream that emits user

    test('provides a stream of user objects', () {
      final service = AuthService(
          FakeFirebaseAuth1(), FakeGoogleSignIn(), FakeAppleSignIn());

      service.streamOfStateChanges.listen(expectAsync1((action) {
        expect(action is StoreUserAction, true);
      }, count: 2));
    });

    test('googleSignInStream resets auth steps on cancel', () {
      final service = AuthService(
          FakeFirebaseAuth1(), FakeGoogleSignInCancels(), FakeAppleSignIn());

      // the service should set auth step to 1 (signing in with google)
      // then due to user cancel (which means google sign in returns null)
      // the service should reset the auth step to 0
      final expectedAuthSteps = [1, 0];

      service.googleSignInStream.listen(expectAsync1((action) {
        expect((action as StoreAuthStepAction).step,
            expectedAuthSteps.removeAt(0));
      }, count: 2));
    });

    test('googleSignInStream emits StoreAuthStep actions at each stage', () {
      final service = AuthService(
          FakeFirebaseAuth1(), FakeGoogleSignIn(), FakeAppleSignIn());

      // the service should set auth step to 1 (signing in with google)
      // then 2 (signing in with Firebase) then reset to 0
      final expectedAuthSteps = [1, 2, 0];

      service.googleSignInStream.listen(expectAsync1((action) {
        expect((action as StoreAuthStepAction).step,
            expectedAuthSteps.removeAt(0));
      }, count: 3));
    });

    // test that errors are handled by being passed to the store
    test('googleSignInStream catches errors and emits StoreProblem actions',
        () async {
      final service = AuthService(
          FakeFirebaseAuth1(), FakeGoogleSignInThrows(), FakeAppleSignIn());

      // the service will emit step 1 indicating google signin is occuring
      // the google signin throws and the service catches the exception then
      // emits an action to reset the auth step then emits a problem with info
      // about the exception
      expect(
          service.googleSignInStream,
          emitsInOrder(<dynamic>[
            TypeMatcher<StoreAuthStepAction>()
              ..having((a) => a.step, 'step', 1),
            TypeMatcher<StoreAuthStepAction>()
              ..having((a) => a.step, 'step', 0),
            TypeMatcher<AddProblemAction>()
              ..having((p) => p.problem.message, 'message',
                  equals('Exception: GoogleSignIn.signIn')),
            emitsDone,
          ]));
    });

    test('appleSignInStream resets auth steps on cancel', () {
      final service = AuthService(
          FakeFirebaseAuth1(), FakeGoogleSignIn(), FakeAppleSignInCancels());

      // the service should set auth step to 1 (signing in with apple)
      // then due to user cancel the service should reset the auth step to 0
      final expectedAuthSteps = [1, 0];

      // check that the stream emits the expected value
      service.appleSignInStream.listen(expectAsync1((action) {
        expect((action as StoreAuthStepAction).step,
            expectedAuthSteps.removeAt(0));
      }, count: 2));
    });

    test('appleSignInStream emits StoreAuthStep actions at each stage', () {
      final service = AuthService(
          FakeFirebaseAuth1(), FakeGoogleSignIn(), FakeAppleSignIn());

      // the service should set auth step to 1 (signing in with apple)
      // then 2 (signing in with Firebase) then reset to 0
      final expectedAuthSteps = [1, 2, 0];

      service.appleSignInStream.listen(expectAsync1((action) {
        // the last action is a problem due to not having valid credentials
        // in the mock object returned by the service
        if (expectedAuthSteps.isEmpty) {
          expect(action is AddProblemAction, true);
        } else {
          expect((action as StoreAuthStepAction).step,
              expectedAuthSteps.removeAt(0));
        }
      }, count: 4));
    });

    // test that errors are handled by being passed to the store
    test('appleSignInStream catches errors and emits StoreProblem actions',
        () async {
      final service = AuthService(
          FakeFirebaseAuth1(), FakeGoogleSignIn(), FakeAppleSignInThrows());

      // the service will emit step 1 indicating apple signin is occuring
      // the apple signin throws and the service catches the exception then
      // emits an action to reset the auth step then emits a problem with info
      // about the exception
      expect(
          service.googleSignInStream,
          emitsInOrder(<dynamic>[
            TypeMatcher<StoreAuthStepAction>()
              ..having((a) => a.step, 'step', 1),
            TypeMatcher<StoreAuthStepAction>()
              ..having((a) => a.step, 'step', 0),
            TypeMatcher<AddProblemAction>()
              ..having((p) => p.problem.message, 'message',
                  equals('Exception: AppleSignIn.signIn')),
            emitsDone,
          ]));
    });
  });
}
