import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/actions/redux_action.dart';
import 'package:podcustard/models/podcast_summary.dart';

part 'store_podcast_summary_action.freezed.dart';
part 'store_podcast_summary_action.g.dart';

@freezed
class StorePodcastSummaryAction with _$StorePodcastSummaryAction, ReduxAction {
  factory StorePodcastSummaryAction(PodcastSummary summary) =
      _StorePodcastSummaryAction;

  factory StorePodcastSummaryAction.fromJson(Map<String, Object?> json) =>
      _$StorePodcastSummaryActionFromJson(json);
}
