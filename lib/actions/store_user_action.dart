import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/actions/redux_action.dart';
import 'package:podcustard/models/user.dart';

part 'store_user_action.freezed.dart';
part 'store_user_action.g.dart';

@freezed
class StoreUserAction with _$StoreUserAction, ReduxAction {
  factory StoreUserAction(User? user) = _StoreUserAction;

  factory StoreUserAction.fromJson(Map<String, dynamic> json) =>
      _$StoreUserActionFromJson(json);
}
