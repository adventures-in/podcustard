import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/models/podcast_summary.dart';
import 'package:redfire/types.dart';

part 'select_podcast_action.freezed.dart';
part 'select_podcast_action.g.dart';

@freezed
class SelectPodcastAction with _$SelectPodcastAction, ReduxAction {
  factory SelectPodcastAction(PodcastSummary selection) = _SelectPodcastAction;

  factory SelectPodcastAction.fromJson(Map<String, Object?> json) =>
      _$SelectPodcastActionFromJson(json);
}
