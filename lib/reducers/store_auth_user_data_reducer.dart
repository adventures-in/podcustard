import 'package:podcustard/actions/auth/store_auth_user_data_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:redux/redux.dart';

class StoreAuthUserDataReducer
    extends TypedReducer<AppState, StoreAuthUserDataAction> {
  StoreAuthUserDataReducer()
      : super(
          (state, action) => state.copyWith(authUserData: action.authUserData),
        );
}
