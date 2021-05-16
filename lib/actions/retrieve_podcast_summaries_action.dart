import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types/redux_action.dart';

part 'retrieve_podcast_summaries_action.freezed.dart';
part 'retrieve_podcast_summaries_action.g.dart';

@freezed
class RetrievePodcastSummariesAction
    with _$RetrievePodcastSummariesAction, ReduxAction {
  factory RetrievePodcastSummariesAction(String query) =
      _RetrievePodcastSummariesAction;

  factory RetrievePodcastSummariesAction.fromJson(Map<String, Object?> json) =>
      _$RetrievePodcastSummariesActionFromJson(json);
}
