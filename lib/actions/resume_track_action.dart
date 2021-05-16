import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types/redux_action.dart';

part 'resume_track_action.freezed.dart';
part 'resume_track_action.g.dart';

@freezed
class ResumeTrackAction with _$ResumeTrackAction, ReduxAction {
  factory ResumeTrackAction() = _ResumeTrackAction;

  factory ResumeTrackAction.fromJson(Map<String, Object?> json) =>
      _$ResumeTrackActionFromJson(json);
}
