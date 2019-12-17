import 'package:redux/redux.dart';
import 'package:podcustard/redux/actions.dart';
import 'package:podcustard/redux/app_state.dart';

/// Reducers specify how the application"s state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, StoreAuthState>(_storeAuthState),
  // ...userReducers,
]);

AppState _storeAuthState(AppState state, StoreAuthState action) {
  return state.rebuild((b) => b..user.id = action.userId);
}
