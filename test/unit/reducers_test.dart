import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:podcustard/actions/store_feed_action.dart';
import 'package:podcustard/actions/store_main_page_index_action.dart';
import 'package:podcustard/actions/store_podcast_summaries_action.dart';
import 'package:podcustard/actions/store_track_action.dart';
import 'package:podcustard/actions/store_track_duration_action.dart';
import 'package:podcustard/actions/store_track_position_action.dart';
import 'package:podcustard/actions/store_track_state_action.dart';
import 'package:podcustard/enums/track_state_enum.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';

import '../test-data/feed_test_data.dart';
import '../test-data/podcast_summary_data.dart';
import '../test-data/track_test_data.dart';

void main() {
  group('Reducer', () {
    test('_storeMainPageIndex correctly stores index from MainPage BottomNav',
        () {
      // create a basic store with the app reducers
      final store = Store<RedFireState>(
        appReducer,
        initialState: AppState.init(),
      );

      // dispatch action to store auth step
      store.dispatch(StoreMainPageIndexAction(1));

      // check that the store has the expected value
      expect(store.state.mainPageIndex, 1);
    });

    test(
        '_storePodcastSummaries correctly stores summaries in the StorePodcastSummaries action',
        () async {
      // create a basic store with the app reducers
      final store = Store<RedFireState>(
        appReducer,
        initialState: AppState.init(),
      );

      final summary = await getInTheDarkSummary();

      // dispatch action to store summaries
      store.dispatch(StorePodcastSummariesAction([summary].lock));

      // check that the store has the expected value
      expect(store.state.podcastSummaries.first, summary);
    });

    test('_storeFeed correctly stores a feed', () async {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      final feed = await getInTheDarkFeed();

      // dispatch action to store the feed
      store.dispatch(StoreFeedAction(feed));

      // check that the store has the expected value
      expect(store.state.detailVM!.feed, feed);
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
      store.dispatch(StoreTrackAction(track));

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
      store.dispatch(StoreTrackAction(track));

      // check the initial track state
      expect(store.state.track!.state, TrackStateEnum.nothing);

      // dispatch to update the track state
      store.dispatch(StoreTrackStateAction(TrackStateEnum.playing));

      // rebuild the test data track with the updated TrackState
      final updatedTrack = track.copyWith(state: TrackStateEnum.playing);

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
      store.dispatch(StoreTrackAction(track));

      // check the initial track duration
      expect(store.state.track!.duration, null);

      // dispatch to update the track duration
      store.dispatch(StoreTrackDurationAction(100.3));

      // rebuild the test data track with the updated duration
      final updatedTrack = track.copyWith(duration: 100.3);

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
      store.dispatch(StoreTrackAction(track));

      // check the initial track position
      expect(store.state.track!.position, null);

      // dispatch to update the track position
      store.dispatch(StoreTrackPositionAction(55.5));

      // rebuild the test data track with the updated position
      final updatedTrack = track.copyWith(position: 55.5);

      // check that the store has the expected value
      expect(store.state.track, updatedTrack);
    });
  });
}
