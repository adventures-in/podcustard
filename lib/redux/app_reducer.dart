import 'package:redux/redux.dart';
import 'package:podcustard/redux/actions.dart';
import 'package:podcustard/redux/app_state.dart';

/// Reducers specify how the application"s state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, AddProblem>(_addProblem),
  TypedReducer<AppState, StoreUser>(_storeUser),
  TypedReducer<AppState, StoreAuthStep>(_storeAuthStep),
  // ...userReducers,
]);

AppState _addProblem(AppState state, AddProblem action) {
  return state.rebuild((b) => b..problems.add(action.problem));
}

AppState _storeUser(AppState state, StoreUser action) {
  // we need to be able to set user to null for when no user signed in
  // but replace won't take null
  // TODO: determine if there is a more elegant way to do this
  // see: https://github.com/google/built_value.dart/issues/238
  return (action.user == null)
      ? state.rebuild((b) => b..user = null)
      : state.rebuild((b) => b..user.replace(action.user));
}

AppState _storeAuthStep(AppState state, StoreAuthStep action) {
  return state.rebuild((b) => b..authStep = action.step);
}
