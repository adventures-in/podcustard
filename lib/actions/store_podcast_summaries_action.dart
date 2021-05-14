import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/actions/redux_action.dart';
import 'package:podcustard/models/podcast_summary.dart';

part 'store_podcast_summaries_action.freezed.dart';
part 'store_podcast_summaries_action.g.dart';

@freezed
class StorePodcastSummariesAction
    with _$StorePodcastSummariesAction, ReduxAction {
  factory StorePodcastSummariesAction(IList<PodcastSummary> summaries) =
      _StorePodcastSummariesAction;

  factory StorePodcastSummariesAction.fromJson(Map<String, Object?> json) =>
      _$StorePodcastSummariesActionFromJson(json);
}
