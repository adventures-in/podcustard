import 'package:flutter/material.dart';
import 'package:podcustard/actions/observe_audio_player_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/widgets/main_page.dart';
import 'package:redfire/widgets.dart';

import 'middleware/build_track_from_episode_middleware.dart';
import 'middleware/observe_audio_player_middleware.dart';
import 'middleware/pause_track_middleware.dart';
import 'middleware/resume_track_middleware.dart';
import 'middleware/retrieve_podcast_summaries_middleware.dart';
import 'middleware/select_podcast_middleware.dart';
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
      middlewares: [
        // Podcasts
        SelectPodcastMiddleware(),
        RetrievePodcastSummariesMiddleware(),
        // Tracks
        BuildTrackFromEpisodeMiddleware(),
        // Player
        ObserveAudioPlayerMiddleware(),
        PauseTrackMiddleware(),
        ResumeTrackMiddleware(),
      ],
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
