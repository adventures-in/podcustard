import 'package:podcustard/models/problem.dart';
import 'package:podcustard/models/user.dart';
import 'package:redux/redux.dart';
import 'package:podcustard/models/actions.dart';
import 'package:podcustard/redux/app_reducer.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:test/test.dart';

void main() {
  group('Reducer', () {
    test('_storeAuthState stores auth state', () {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // dispatch action to store auth state
      store.dispatch(Action.StoreUser(
          user: User((b) => b
            ..displayName = 'name'
            ..email = 'email'
            ..photoUrl = 'url'
            ..uid = 'uid')));

      // check that the store has the expected value
      expect(store.state.user.uid, equals('uid'));
      expect(store.state.user.email, equals('email'));
      expect(store.state.user.photoUrl, equals('url'));
      expect(store.state.user.displayName, equals('name'));
    });

    test('_addProblem adds to the list', () {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // dispatch action to add a problem
      store.dispatch(Action.AddProblem(
          problem: Problem((b) => b
            ..message = 'm'
            ..info = {'a': 'b'}
            ..state.replace(AppState.init())
            ..trace = 'trace'
            ..type = ProblemTypeEnum.signin)));

      // check that the store has the expected value
      expect(store.state.problems.length, 1);
      final problem = store.state.problems.first;
      expect(problem.message, 'm');
      expect(problem.info, {'a': 'b'});
      expect(problem.state, AppState.init());
      expect(problem.trace, 'trace');
      expect(problem.type, ProblemTypeEnum.signin);
    });

    test('_storeAuthStep stores the auth step', () {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // dispatch action to store auth step
      store.dispatch(Action.StoreAuthStep(step: 1));

      // check that the store has the expected value
      expect(store.state.authStep, 1);
    });
  });
}
