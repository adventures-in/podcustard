import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types/redux_action.dart';

part 'build_track_from_episode_action.freezed.dart';
part 'build_track_from_episode_action.g.dart';

@freezed
class BuildTrackFromEpisodeAction
    with _$BuildTrackFromEpisodeAction, ReduxAction {
  factory BuildTrackFromEpisodeAction(String audioUrl, String episodeTitle) =
      _BuildTrackFromEpisodeAction;

  factory BuildTrackFromEpisodeAction.fromJson(Map<String, Object?> json) =>
      _$BuildTrackFromEpisodeActionFromJson(json);
}
