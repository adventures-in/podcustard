import 'package:podcustard/models/track.dart';
import 'package:podcustard/services/audio_player_service.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:podcustard/services/itunes_service.dart';
import 'package:redux/redux.dart';
import 'package:podcustard/models/actions.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/services/auth_service.dart';

/// Middleware is used for a variety of things:
/// - Logging
/// - Async calls (database, network)
/// - Calling to system frameworks
///
/// These are performed when actions are dispatched to the Store
///
/// The output of an action can perform another action using the [NextDispatcher]
///
List<Middleware<AppState>> createMiddleware(
    {AuthService authService,
    ItunesService itunesService,
    FeedsService feedsService,
    AudioPlayerService audioPlayerService}) {
  return [
    TypedMiddleware<AppState, ObserveAuthState>(
      _observeAuthState(authService),
    ),
    TypedMiddleware<AppState, SigninWithGoogle>(
      _signInWithGoogle(authService),
    ),
    TypedMiddleware<AppState, SigninWithApple>(
      _signInWithApple(authService),
    ),
    TypedMiddleware<AppState, RetrievePodcastSummaries>(
      _retrievePodcastSummaries(itunesService),
    ),
    TypedMiddleware<AppState, SelectPodcast>(
      _retrieveFeed(feedsService),
    ),
    TypedMiddleware<AppState, ObserveAudioPlayer>(
      _observeAudioPlayer(audioPlayerService),
    ),
    TypedMiddleware<AppState, BuildTrackFromEpisode>(
      _buildTrackFromEpisode(audioPlayerService),
    ),
    TypedMiddleware<AppState, PauseTrack>(
      _pauseTrack(audioPlayerService),
    ),
    TypedMiddleware<AppState, ResumeTrack>(
      _resumeTrack(audioPlayerService),
    ),
  ];
}

void Function(
        Store<AppState> store, ObserveAuthState action, NextDispatcher next)
    _observeAuthState(AuthService authService) {
  return (Store<AppState> store, ObserveAuthState action,
      NextDispatcher next) async {
    next(action);

    // listen to the stream that emits actions on any auth change
    // and call dispatch on the action
    authService.streamOfStateChanges.listen(store.dispatch);
  };
}

void Function(
        Store<AppState> store, SigninWithGoogle action, NextDispatcher next)
    _signInWithGoogle(AuthService authService) {
  return (Store<AppState> store, SigninWithGoogle action,
      NextDispatcher next) async {
    next(action);

    // signin and listen to the stream and dispatch actions
    authService.googleSignInStream.listen(store.dispatch);
  };
}

void Function(
        Store<AppState> store, SigninWithApple action, NextDispatcher next)
    _signInWithApple(AuthService authService) {
  return (Store<AppState> store, SigninWithApple action,
      NextDispatcher next) async {
    next(action);

    // signin and listen to the stream and dispatch actions
    authService.appleSignInStream.listen(store.dispatch);
  };
}

void Function(Store<AppState> store, RetrievePodcastSummaries action,
        NextDispatcher next)
    _retrievePodcastSummaries(ItunesService itunesService) {
  return (Store<AppState> store, RetrievePodcastSummaries action,
      NextDispatcher next) async {
    next(action);

    // retrieve podcast summaries and dispatch action to store result
    final storeAction =
        await itunesService.retrievePodcastSummaries(query: action.query);
    store.dispatch(storeAction);
  };
}

void Function(Store<AppState> store, SelectPodcast action, NextDispatcher next)
    _retrieveFeed(FeedsService feedsService) {
  return (Store<AppState> store, SelectPodcast action,
      NextDispatcher next) async {
    next(action);

    // retrieve feed and dispatch action to store result
    final storeAction =
        await feedsService.retrieveFeed(url: action.podcast.feedUrl);
    store.dispatch(storeAction);
  };
}

void Function(
        Store<AppState> store, ObserveAudioPlayer action, NextDispatcher next)
    _observeAudioPlayer(AudioPlayerService audioPlayerService) {
  return (Store<AppState> store, ObserveAudioPlayer action,
      NextDispatcher next) async {
    next(action);

    // listen to the stream of audio player events and dispatch actions
    audioPlayerService.streamOfAudioEvents.listen(store.dispatch);
  };
}

void Function(Store<AppState> store, BuildTrackFromEpisode action,
        NextDispatcher next)
    _buildTrackFromEpisode(AudioPlayerService audioPlayerService) {
  return (Store<AppState> store, BuildTrackFromEpisode action,
      NextDispatcher next) async {
    next(action);

    final track = Track((b) => b
      ..author = store.state.detailVM.summary.artistName
      ..imageUrl = store.state.detailVM.summary.artworkUrl60
      ..audioUrl = action.audioUrl
      ..episode = action.episodeTitle
      ..state = TrackStateEnum.nothing);
    store.dispatch(StoreTrack(track: track));

    // load and play the track, the service will emit relevant actions
    // into its stream and the _observeAudioPlayer middleware will dispatch
    // actions as they are emitted
    await audioPlayerService.loadWithUrl(action.audioUrl);
    await audioPlayerService.play();
  };
}

void Function(Store<AppState> store, PauseTrack action, NextDispatcher next)
    _pauseTrack(AudioPlayerService audioPlayerService) {
  return (Store<AppState> store, PauseTrack action, NextDispatcher next) async {
    next(action);

    await audioPlayerService.pause();
  };
}

void Function(Store<AppState> store, ResumeTrack action, NextDispatcher next)
    _resumeTrack(AudioPlayerService audioPlayerService) {
  return (Store<AppState> store, ResumeTrack action,
      NextDispatcher next) async {
    next(action);

    await audioPlayerService.resume();
  };
}
