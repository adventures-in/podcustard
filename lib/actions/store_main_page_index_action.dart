import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/actions/redux_action.dart';

part 'store_main_page_index_action.freezed.dart';
part 'store_main_page_index_action.g.dart';

@freezed
class StoreMainPageIndexAction with _$StoreMainPageIndexAction, ReduxAction {
  factory StoreMainPageIndexAction(int index) = _StoreMainPageIndexAction;

  factory StoreMainPageIndexAction.fromJson(Map<String, Object?> json) =>
      _$StoreMainPageIndexActionFromJson(json);
}
