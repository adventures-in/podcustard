import 'package:podcustard/models/app_state.dart';
import 'package:redfire/auth/actions/store_auth_step_action.dart';
import 'package:redux/redux.dart';

class StoreAuthStepReducer extends TypedReducer<AppState, StoreAuthStepAction> {
  StoreAuthStepReducer()
      : super(
          (state, action) => state.copyWith(authStep: action.step),
        );
}
