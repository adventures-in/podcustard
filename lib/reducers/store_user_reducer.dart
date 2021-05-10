import 'package:podcustard/actions/store_user_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:redux/redux.dart';

class StoreUserReducer extends TypedReducer<AppState, StoreUserAction> {
  StoreUserReducer()
      : super(
          (state, action) => state.copyWith(user: action.user),
        );
}
