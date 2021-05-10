import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/actions/redux_action.dart';

part 'store_auth_step_action.freezed.dart';
part 'store_auth_step_action.g.dart';

@freezed
class StoreAuthStepAction with _$StoreAuthStepAction, ReduxAction {
  factory StoreAuthStepAction(int step) = _StoreAuthStepAction;

  factory StoreAuthStepAction.fromJson(Map<String, dynamic> json) =>
      _$StoreAuthStepActionFromJson(json);
}
