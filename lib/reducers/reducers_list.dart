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
import 'package:redux/redux.dart';

final reducers = <Reducer<AppState>>[
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
