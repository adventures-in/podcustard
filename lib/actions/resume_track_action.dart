import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/actions/redux_action.dart';

part 'resume_track_action.freezed.dart';
part 'resume_track_action.g.dart';

@freezed
class ResumeTrackAction with _$ResumeTrackAction, ReduxAction {
  factory ResumeTrackAction() = _ResumeTrackAction;

  factory ResumeTrackAction.fromJson(Map<String, dynamic> json) =>
      _$ResumeTrackActionFromJson(json);
}
