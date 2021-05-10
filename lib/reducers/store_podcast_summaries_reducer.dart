import 'package:podcustard/actions/store_podcast_summaries_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:redux/redux.dart';

class StorePodcastSummariesReducer
    extends TypedReducer<AppState, StorePodcastSummariesAction> {
  StorePodcastSummariesReducer()
      : super(
          (state, action) => state.copyWith(podcastSummaries: action.summaries),
        );
}
