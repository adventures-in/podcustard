import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/actions/redux_action.dart';

part 'pause_track_action.freezed.dart';
part 'pause_track_action.g.dart';

@freezed
class PauseTrackAction with _$PauseTrackAction, ReduxAction {
  factory PauseTrackAction() = _PauseTrackAction;

  factory PauseTrackAction.fromJson(Map<String, Object?> json) =>
      _$PauseTrackActionFromJson(json);
}
