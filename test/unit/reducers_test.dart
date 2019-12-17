import 'package:redux/redux.dart';
import 'package:podcustard/redux/actions.dart';
import 'package:podcustard/redux/app_reducer.dart';
import 'package:podcustard/redux/app_state.dart';
import "package:test/test.dart";

void main() {
  test("_storeAuthState reducer stores auth state", () {
    // create a basic store with the app reducers
    final store = Store<AppState>(
      appReducer,
      initialState: AppState.init(),
    );

    // dispatch action to store auth state
    store.dispatch(Action.StoreAuthState(userId: 'test'));

    // check that the store has the expected value
    expect(store.state.user.id, equals('test'));
  });
}
