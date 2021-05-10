import 'package:podcustard/actions/store_theme_mode_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:redux/redux.dart';

class StoreThemeModeReducer
    extends TypedReducer<AppState, StoreThemeModeAction> {
  StoreThemeModeReducer()
      : super(
          (state, action) => state.copyWith(themeMode: action.themeMode),
        );
}
