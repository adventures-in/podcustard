import 'package:podcustard/actions/store_main_page_index_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:redux/redux.dart';

class StoreMainPageIndexReducer
    extends TypedReducer<AppState, StoreMainPageIndexAction> {
  StoreMainPageIndexReducer()
      : super(
          (state, action) => state.copyWith(mainPageIndex: action.index),
        );
}
