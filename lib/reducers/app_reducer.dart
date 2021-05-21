import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/reducers/clear_podcast_selection_reducer.dart';
import 'package:podcustard/reducers/store_feed_reducer.dart';
import 'package:podcustard/reducers/store_main_page_index_reducer.dart';
import 'package:podcustard/reducers/store_podcast_summaries_reducer.dart';
import 'package:podcustard/reducers/store_podcast_summary_reducer.dart';
import 'package:podcustard/reducers/store_track_duration_reducer.dart';
import 'package:podcustard/reducers/store_track_position_reducer.dart';
import 'package:podcustard/reducers/store_track_reducer.dart';
import 'package:podcustard/reducers/store_track_state_reducer.dart';
import 'package:redfire/utils/redux/redfire_reducers.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application"s state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final appReducer = (dynamic state, dynamic action) {
  final reducers = <ReducerClass<dynamic>>[
    ...redfireReducers,
    ClearPodcastSelectionReducer(),
    StoreFeedReducer(),
    StoreMainPageIndexReducer(),
    StorePodcastSummariesReducer(),
    StorePodcastSummaryReducer(),
    StoreTrackDurationReducer(),
    StoreTrackPositionReducer(),
    StoreTrackStateReducer(),
    StoreTrackReducer(),
  ];
  for (final reducer in reducers) {
    state = reducer(state, action);
  }
  return state;
};
