import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/actions/redux_action.dart';

part 'signin_with_google_action.freezed.dart';
part 'signin_with_google_action.g.dart';

@freezed
class SigninWithGoogleAction with _$SigninWithGoogleAction, ReduxAction {
  factory SigninWithGoogleAction() = _SigninWithGoogleAction;

  factory SigninWithGoogleAction.fromJson(Map<String, Object?> json) =>
      _$SigninWithGoogleActionFromJson(json);
}
