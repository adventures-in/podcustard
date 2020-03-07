import 'dart:async';

import 'package:mockito/mockito.dart';
import 'package:podcustard/models/actions/add_problem.dart';
import 'package:podcustard/models/actions/build_track_from_episode.dart';
import 'package:podcustard/models/actions/observe_audio_player.dart';
import 'package:podcustard/models/actions/observe_auth_state.dart';
import 'package:podcustard/models/actions/pause_track.dart';
import 'package:podcustard/models/actions/redux_action.dart';
import 'package:podcustard/models/actions/resume_track.dart';
import 'package:podcustard/models/actions/retrieve_podcast_summaries.dart';
import 'package:podcustard/models/actions/select_podcast.dart';
import 'package:podcustard/models/actions/signin_with_apple.dart';
import 'package:podcustard/models/actions/signin_with_google.dart';
import 'package:podcustard/models/actions/store_auth_step.dart';
import 'package:podcustard/models/actions/store_track.dart';
import 'package:podcustard/models/actions/store_user.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/redux/app_reducer.dart';
import 'package:podcustard/redux/middleware.dart';
import 'package:podcustard/services/auth_service.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:podcustard/services/itunes_service.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';

import '../data/feed_test_data.dart';
import '../data/podcast_summary_data.dart';
import '../data/track_test_data.dart';
import '../mocks/audio_player_service_mocks.dart';
import '../mocks/feeds_service_mocks.dart';
import '../mocks/http_client_mocks.dart';

class MockAuthService extends Mock implements AuthService {}

void main() {
  group('Middleware', () {
    test('_observeAuthState listens to stream and emits actions', () async {
      // setup a mock auth service to give a test response
      final mockAuthService = MockAuthService();
      when(mockAuthService.streamOfStateChanges).thenAnswer(
        (_) => Stream.fromIterable([
          StoreUser((b) => b.user
            ..uid = 'id'
            ..email = 'email'
            ..displayName = 'name'
            ..photoUrl = 'url')
        ]),
      );

      // create a basic store with the mocked out middleware
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
        middleware: createMiddleware(authService: mockAuthService),
      );

      // dispatch action to observe the auth state
      store.dispatch(ObserveAuthState());

      // verify the middleware used the service to get a stream of auth state
      verify(mockAuthService.streamOfStateChanges);

      // wait for the stream to complete so we can test that the middleware did it's thing
      await for (ReduxAction _ in mockAuthService.streamOfStateChanges) {}

      // all the middleware does is dispatch a StoreAuthState action so check the state
      expect(store.state.user.uid, 'id');
    });

    test(
        '_signInWithGoogle starts signin sequence and dispatches emitted actions',
        () async {
      // setup a mock auth service to give a test response
      final mockAuthService = MockAuthService();
      when(mockAuthService.googleSignInStream).thenAnswer(
        (_) => Stream.fromIterable([
          StoreAuthStep((b) => b..step = 1),
          AddProblem((b) => b.problem
            ..message = 'm'
            ..type = ProblemTypeEnum.googleSignin)
        ]),
      );

      // create a basic store with the mocked out middleware
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
        middleware: createMiddleware(authService: mockAuthService),
      );

      // dispatch action to initiate signin
      store.dispatch(SigninWithGoogle());

      // verify the middleware used the service to get a stream of actions
      verify(mockAuthService.googleSignInStream);

      // wait for the stream to complete so we can test that the middleware did it's thing
      await for (ReduxAction _ in mockAuthService.googleSignInStream) {}

      // all the middleware does is dispatch a StoreAuthState action so check the state
      expect(store.state.authStep, 1);
      expect(store.state.problems.length, 1);
    });

    test(
        '_signInWithApple starts signin sequence and dispatches emitted actions',
        () async {
      // setup a mock auth service to give a test response
      final mockAuthService = MockAuthService();
      when(mockAuthService.appleSignInStream).thenAnswer(
        (_) => Stream.fromIterable([
          StoreAuthStep((b) => b..step = 1),
          AddProblem((b) => b.problem
            ..message = 'm'
            ..type = ProblemTypeEnum.googleSignin)
        ]),
      );

      // create a basic store with the mocked out middleware
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
        middleware: createMiddleware(authService: mockAuthService),
      );

      // dispatch action to initiate signin
      store.dispatch(SigninWithApple());

      // verify the middleware used the service to get a stream of actions
      verify(mockAuthService.appleSignInStream);

      // wait for the stream to complete so we can test that the middleware did it's thing
      await for (ReduxAction _ in mockAuthService.appleSignInStream) {}

      // all the middleware does is dispatch a StoreAuthState action so check the state
      expect(store.state.authStep, 1);
      expect(store.state.problems.length, 1);
    });

    test('_retrievePodcastSummaries uses service to retrieve summaries',
        () async {
      // setup a mock service to give a test response
      final fakeService = ItunesService(
          FakeHttpClient(response: summaries_json_response_string));

      // create a basic store with the mocked out middleware
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
        middleware: createMiddleware(itunesService: fakeService),
      );

      // dispatch action to initiate signin
      await store.dispatch(RetrievePodcastSummaries((b) => b..query = 'query'));

      // mut dispatches a StorePodcastSummaries action so we check the state
      expect(store.state.podcastSummaries.length, 50);
    });

    test('_retrieveFeed retrieves and parses the feed', () async {
      // setup a mock service to give a test response
      final fakeService =
          FeedsService(FakeHttpClient(response: in_the_dark_feed));

      // create a basic store with the mocked out middleware
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
        middleware: createMiddleware(feedsService: fakeService),
      );

      final summary = await getInTheDarkSummary();

      // dispatch action to initiate retrieving the feed
      await store
          .dispatch(SelectPodcast((b) => b..selection = summary.toBuilder()));

      final feed = await getInTheDarkFeed();

      // mut dispatches a StoreFeed action so we check the state
      expect(store.state.detailVM.feed, feed);
    });

    test('_observeAudioPlayer listens to audio service and dispatches',
        () async {
      // setup a mock service to give a test response
      final controller = StreamController<ReduxAction>();
      final fakeService = FakeAudioPlayerService(controller: controller);

      // create a basic store with the mocked out middleware
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
        middleware: createMiddleware(audioPlayerService: fakeService),
      );

      // trigger the _observeAudioPlayer function (ie. the sut)
      store.dispatch(ObserveAudioPlayer());

      // create a test data object
      final track = in_the_dark_s2e18_track;

      // push an action into the stream
      await controller.add(StoreTrack((b) => b..track = track.toBuilder()));

      // check that action emitted by service produced expected state
      expect(store.state.track, track);
    });

    test('_buildTrackFromEpisode loads and plays the track', () async {
      // setup a mock service to give a test response
      final controller = StreamController<ReduxAction>();

      // create a basic store with the mocked out middleware
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
        middleware: createMiddleware(
            feedsService: FakeFeedsService(),
            audioPlayerService: FakeAudioPlayerService(controller: controller)),
      );

      final summary = await getInTheDarkSummary();

      store.dispatch(SelectPodcast((b) => b..selection = summary.toBuilder()));

      final track = in_the_dark_s2e18_track;

      store.dispatch(BuildTrackFromEpisode((b) => b
        ..audioUrl = track.audioUrl
        ..episodeTitle = track.episode));

      // check that action emitted by service produced expected state
      expect(store.state.track, track);
    });

    test('_pauseTrack pauses the track and stores state', () async {
      // setup a mock service to give a test response
      final controller = StreamController<ReduxAction>();
      final service = FakeAudioPlayerService(controller: controller);

      // create a basic store with the mocked out middleware
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
        middleware: createMiddleware(
            audioPlayerService: service, feedsService: FakeFeedsService()),
      );

      // add a track to the app state
      final summary = await getInTheDarkSummary();
      final track = in_the_dark_s2e18_track;
      store.dispatch(SelectPodcast((b) => b..selection = summary.toBuilder()));
      store.dispatch(BuildTrackFromEpisode((b) => b
        ..audioUrl = track.audioUrl
        ..episodeTitle = track.episode));

      store.dispatch(PauseTrack());

      // check that the action resulted in the service being called
      expect(service.pausedCount, 1);
    });

    test('_resumeTrack resumes the track and sets state', () async {
      // setup a mock service to give a test response
      final controller = StreamController<ReduxAction>();
      final service = FakeAudioPlayerService(controller: controller);
      // create a basic store with the mocked out middleware
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
        middleware: createMiddleware(
            audioPlayerService: service, feedsService: FakeFeedsService()),
      );

      // add a track to the app state
      final summary = await getInTheDarkSummary();
      final track = in_the_dark_s2e18_track;
      store.dispatch(SelectPodcast((b) => b..selection = summary.toBuilder()));
      store.dispatch(BuildTrackFromEpisode((b) => b
        ..audioUrl = track.audioUrl
        ..episodeTitle = track.episode));

      store.dispatch(ResumeTrack());

      // check that the action resulted in the service being called
      expect(service.resumedCount, 1);
    });
  });
}
