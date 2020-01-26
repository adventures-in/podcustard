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
List<Middleware<AppState>> createMiddleware(AuthService authService,
    ItunesService itunesService, FeedsService feedsService) {
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
