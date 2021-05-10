import 'package:podcustard/middleware/build_track_from_episode_middleware.dart';
import 'package:podcustard/middleware/observe_audio_player_middleware.dart';
import 'package:podcustard/middleware/observe_auth_state_middleware.dart';
import 'package:podcustard/middleware/pause_track_middleware.dart';
import 'package:podcustard/middleware/resume_track_middleware.dart';
import 'package:podcustard/middleware/retrieve_podcast_summaries_middleware.dart';
import 'package:podcustard/middleware/select_podcast_middleware.dart';
import 'package:podcustard/middleware/signin_with_apple_middleware.dart';
import 'package:podcustard/middleware/signin_with_google_middleware.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/services/audio_player_service.dart';
import 'package:podcustard/services/auth_service.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:podcustard/services/itunes_service.dart';
import 'package:redux/redux.dart';

/// Middleware is used for a variety of things that are performed when actions
/// are dispatched to the Store.  For example: Logging, Async calls (database,
/// network), Calling to system frameworks.
///
/// The middleawre can also perform another action using the [NextDispatcher]
List<Middleware<AppState>> createMiddleware(
    {required AuthService authService,
    required ItunesService itunesService,
    required FeedsService feedsService,
    required AudioPlayerService audioPlayerService}) {
  return [
    BuildTrackFromEpisodeMiddleware(audioPlayerService),
    ObserveAudioPlayerMiddleware(audioPlayerService),
    ObserveAuthStateMiddleware(authService),
    PauseTrackMiddleware(audioPlayerService),
    RetrievePodcastSummariesMiddleware(itunesService),
    ResumeTrackMiddleware(audioPlayerService),
    SigninWithAppleMiddleware(authService),
    SigninWithGoogleMiddleware(authService),
    SelectPodcastMiddleware(feedsService),
  ];
}
