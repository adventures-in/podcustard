import 'package:flutter/material.dart';
import 'package:podcustard/actions/observe_audio_player_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/widgets/main_page.dart';
import 'package:redfire/widgets.dart';

import 'reducers/clear_podcast_selection_reducer.dart';
import 'reducers/store_feed_reducer.dart';
import 'reducers/store_main_page_index_reducer.dart';
import 'reducers/store_podcast_summaries_reducer.dart';
import 'reducers/store_podcast_summary_reducer.dart';
import 'reducers/store_track_duration_reducer.dart';
import 'reducers/store_track_position_reducer.dart';
import 'reducers/store_track_reducer.dart';
import 'reducers/store_track_state_reducer.dart';

void main() => runApp(AppWidget<AppState>(
      initialState: AppState.init(),
      initialActions: [ObserveAudioPlayerAction()],
      middlewares: const [],
      reducers: [
        ClearPodcastSelectionReducer(),
        StoreFeedReducer(),
        StoreMainPageIndexReducer(),
        StorePodcastSummariesReducer(),
        StorePodcastSummaryReducer(),
        StoreTrackDurationReducer(),
        StoreTrackPositionReducer(),
        StoreTrackStateReducer(),
        StoreTrackReducer(),
      ],
      mainPage: MainPage(),
    ));
