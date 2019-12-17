import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:podcustard/redux/actions.dart';
import 'package:podcustard/redux/app_reducer.dart';
import 'package:podcustard/redux/app_state.dart';
import 'package:podcustard/redux/middleware.dart';
import 'package:podcustard/services/auth_service.dart';
import "package:test/test.dart";

class MockAuthService extends Mock implements AuthService {}

void main() {
  group("Middleware", () {
    test("_observeAuthState listens to stream and emits actions", () async {
      // setup a mock auth service to give a test response
      final mockAuthService = MockAuthService();
      when(mockAuthService.streamOfStateChanges).thenAnswer(
        (_) => Stream.fromIterable([Action.StoreAuthState(userId: 'test')]),
      );

      // create a basic store with the mocked out middleware
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
        middleware: createMiddleware(
          mockAuthService,
        ),
      );

      // dispatch action to observe the auth state
      store.dispatch(Action.ObserveAuthState());

      // verify the middleware used the service to get a stream of auth state
      verify(mockAuthService.streamOfStateChanges);

      // wait for the stream to complete so we can test that the middleware did it's thing
      await for (Action _ in mockAuthService.streamOfStateChanges) {}

      // all the middleware does is dispatch a StoreAuthState action so check the state
      expect(store.state.user.id, 'test');
    });
  });
}
