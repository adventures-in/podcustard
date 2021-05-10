import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/actions/redux_action.dart';

part 'store_theme_mode_action.freezed.dart';
part 'store_theme_mode_action.g.dart';

@freezed
class StoreThemeModeAction with _$StoreThemeModeAction, ReduxAction {
  factory StoreThemeModeAction(int themeMode) = _StoreThemeModeAction;

  factory StoreThemeModeAction.fromJson(Map<String, dynamic> json) =>
      _$StoreThemeModeActionFromJson(json);
}
