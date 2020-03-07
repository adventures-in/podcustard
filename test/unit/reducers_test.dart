import 'package:built_collection/built_collection.dart';
import 'package:podcustard/models/actions/add_problem.dart';
import 'package:podcustard/models/actions/store_auth_step.dart';
import 'package:podcustard/models/actions/store_feed.dart';
import 'package:podcustard/models/actions/store_main_page_index.dart';
import 'package:podcustard/models/actions/store_podcast_summaries.dart';
import 'package:podcustard/models/actions/store_theme_mode.dart';
import 'package:podcustard/models/actions/store_track.dart';
import 'package:podcustard/models/actions/store_track_duration.dart';
import 'package:podcustard/models/actions/store_track_position.dart';
import 'package:podcustard/models/actions/store_track_state.dart';
import 'package:podcustard/models/actions/store_user.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/models/track.dart';
import 'package:redux/redux.dart';
import 'package:podcustard/redux/app_reducer.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:test/test.dart';

import '../data/feed_test_data.dart';
import '../data/podcast_summary_data.dart';
import '../data/track_test_data.dart';

void main() {
  group('Reducer', () {
    test('_storeAuthState stores auth state', () {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // dispatch action to store auth state
      store.dispatch(StoreUser((b) => b.user
        ..displayName = 'name'
        ..email = 'email'
        ..photoUrl = 'url'
        ..uid = 'uid'));

      // check that the store has the expected value
      expect(store.state.user.uid, equals('uid'));
      expect(store.state.user.email, equals('email'));
      expect(store.state.user.photoUrl, equals('url'));
      expect(store.state.user.displayName, equals('name'));
    });

    test('_addProblem adds to the list', () {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // dispatch action to add a problem
      store.dispatch(AddProblem((b) => b.problem
        ..message = 'm'
        ..info = {'a': 'b'}
        ..state.replace(AppState.init())
        ..trace = 'trace'
        ..type = ProblemTypeEnum.googleSignin));

      // check that the store has the expected value
      expect(store.state.problems.length, 1);
      final problem = store.state.problems.first;
      expect(problem.message, 'm');
      expect(problem.info, {'a': 'b'});
      expect(problem.state, AppState.init());
      expect(problem.trace, 'trace');
      expect(problem.type, ProblemTypeEnum.googleSignin);
    });

    test('_storeAuthStep stores the auth step', () {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // dispatch action to store auth step
      store.dispatch(StoreAuthStep((b) => b..step = 1));

      // check that the store has the expected value
      expect(store.state.authStep, 1);
    });

    test('_storeMainPageIndex correctly stores index from MainPage BottomNav',
        () {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // dispatch action to store auth step
      store.dispatch(StoreMainPageIndex((b) => b..index = 1));

      // check that the store has the expected value
      expect(store.state.mainPageIndex, 1);
    });

    test(
        '_storePodcastSummaries correctly stores summaries in the StorePodcastSummaries action',
        () async {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      final summary = await getInTheDarkSummary();

      // dispatch action to store summaries
      store.dispatch(
          StorePodcastSummaries((b) => b..summaries = ListBuilder([summary])));

      // check that the store has the expected value
      expect(store.state.podcastSummaries.first, summary);
    });

    test('_storeThemeMode correctly stores themeMode', () {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // dispatch action to store themeMode
      store.dispatch(StoreThemeMode((b) => b..themeMode = 0));

      // check that the store has the expected value
      expect(store.state.themeMode, 0);

      // dispatch action to store themeMode
      store.dispatch(StoreThemeMode((b) => b..themeMode = 1));

      // check that the store has the expected value
      expect(store.state.themeMode, 1);
    });

    test('_storeFeed correctly stores a feed', () async {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      final feed = await getInTheDarkFeed();

      // dispatch action to store the feed
      store.dispatch(StoreFeed((b) => b..feed = feed.toBuilder()));

      // check that the store has the expected value
      expect(store.state.detailVM.feed, feed);
    });

    test('_storeTrack correctly stores a track', () async {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // use a pre-defined track from the test data
      final track = in_the_dark_s2e18_track;

      // dispatch action to store the track
      store.dispatch(StoreTrack((b) => b..track = track.toBuilder()));

      // check that the store has the expected value
      expect(store.state.track, track);
    });

    test('_storeTrackState sets the state for the current track', () async {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // use a pre-defined track from the test data
      final track = in_the_dark_s2e18_track;

      // dispatch action to store the track
      store.dispatch(StoreTrack((b) => b..track = track.toBuilder()));

      // check the initial track state
      expect(store.state.track.state, TrackStateEnum.nothing);

      // dispatch to update the track state
      store.dispatch(StoreTrackState((b) => b..state = TrackStateEnum.playing));

      // rebuild the test data track with the updated TrackState
      final updatedTrack =
          track.rebuild((b) => b..state = TrackStateEnum.playing);

      // check that the store has the expected value
      expect(store.state.track, updatedTrack);
    });

    test('_storeTrackDuration sets the duration for the current track',
        () async {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // use a pre-defined track from the test data
      final track = in_the_dark_s2e18_track;

      // dispatch action to store the track
      store.dispatch(StoreTrack((b) => b..track = track.toBuilder()));

      // check the initial track duration
      expect(store.state.track.duration, null);

      // dispatch to update the track duration
      store.dispatch(StoreTrackDuration((b) => b..duration = 100.3));

      // rebuild the test data track with the updated duration
      final updatedTrack = track.rebuild((b) => b..duration = 100.3);

      // check that the store has the expected value
      expect(store.state.track, updatedTrack);
    });

    test('_storeTrackPosition sets the position for the current track',
        () async {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // use a pre-defined track from the test data
      final track = in_the_dark_s2e18_track;

      // dispatch action to store the track
      store.dispatch(StoreTrack((b) => b..track = track.toBuilder()));

      // check the initial track position
      expect(store.state.track.position, null);

      // dispatch to update the track position
      store.dispatch(StoreTrackPosition((b) => b..position = 55.5));

      // rebuild the test data track with the updated position
      final updatedTrack = track.rebuild((b) => b..position = 55.5);

      // check that the store has the expected value
      expect(store.state.track, updatedTrack);
    });
  });
}
