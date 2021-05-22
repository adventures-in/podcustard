import 'package:podcustard/middleware/build_track_from_episode_middleware.dart';
import 'package:podcustard/middleware/observe_audio_player_middleware.dart';
import 'package:podcustard/middleware/pause_track_middleware.dart';
import 'package:podcustard/middleware/resume_track_middleware.dart';
import 'package:podcustard/middleware/retrieve_podcast_summaries_middleware.dart';
import 'package:podcustard/middleware/select_podcast_middleware.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/services/audio_player_service.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:podcustard/services/itunes_service.dart';
import 'package:redux/redux.dart';

/// Middleware is used for a variety of things that are performed when actions
/// are dispatched to the Store.  For example: Logging, Async calls (database,
/// network), Calling to system frameworks.
///
/// The middleawre can also perform another action using the [NextDispatcher]
List<Middleware<AppState>> appMiddleware(
    {required ItunesService iTunesService,
    required FeedsService feedsService,
    required AudioPlayerService audioPlayerService}) {
  return [
    // Podcasts
    SelectPodcastMiddleware(feedsService),
    RetrievePodcastSummariesMiddleware(iTunesService),

    // Tracks
    BuildTrackFromEpisodeMiddleware(audioPlayerService),

    // Player
    ObserveAudioPlayerMiddleware(audioPlayerService),
    PauseTrackMiddleware(audioPlayerService),
    ResumeTrackMiddleware(audioPlayerService),
  ];
}
