import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/services/auth_service.dart';
import 'package:redfire/auth/actions/observe_auth_state_action.dart';
import 'package:redux/redux.dart';

class ObserveAuthStateMiddleware
    extends TypedMiddleware<AppState, ObserveAuthStateAction> {
  ObserveAuthStateMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          // listen to the stream that emits actions on any auth change
          // and call dispatch on the action
          authService.streamOfStateChanges.listen(store.dispatch);
        });
}
