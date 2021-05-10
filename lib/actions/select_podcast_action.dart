import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/actions/redux_action.dart';
import 'package:podcustard/models/podcast_summary.dart';

part 'select_podcast_action.freezed.dart';
part 'select_podcast_action.g.dart';

@freezed
class SelectPodcastAction with _$SelectPodcastAction, ReduxAction {
  factory SelectPodcastAction(PodcastSummary selection) = _SelectPodcastAction;

  factory SelectPodcastAction.fromJson(Map<String, dynamic> json) =>
      _$SelectPodcastActionFromJson(json);
}
