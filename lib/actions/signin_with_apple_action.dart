import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/actions/redux_action.dart';

part 'signin_with_apple_action.freezed.dart';
part 'signin_with_apple_action.g.dart';

@freezed
class SigninWithAppleAction with _$SigninWithAppleAction, ReduxAction {
  factory SigninWithAppleAction() = _SigninWithAppleAction;

  factory SigninWithAppleAction.fromJson(Map<String, dynamic> json) =>
      _$SigninWithAppleActionFromJson(json);
}
