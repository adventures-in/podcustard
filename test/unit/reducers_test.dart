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
import 'package:podcustard/models/podcast_summary.dart';
import 'package:podcustard/reducers/store_feed_reducer.dart';
import 'package:podcustard/reducers/store_main_page_index_reducer.dart';
import 'package:podcustard/reducers/store_podcast_summaries_reducer.dart';
import 'package:podcustard/reducers/store_track_duration_reducer.dart';
import 'package:podcustard/reducers/store_track_position_reducer.dart';
import 'package:podcustard/reducers/store_track_reducer.dart';
import 'package:podcustard/reducers/store_track_state_reducer.dart';
import 'package:test/test.dart';

import '../test-data/feed_test_data.dart';
import '../test-data/podcast_summary_data.dart';
import '../test-data/track_test_data.dart';

void main() {
  group('StoreMainPageIndexReducer', () {
    test('correctly stores index', () {
      final initialState = AppState.init();
      expect(initialState.mainPageIndex, 0);

      final reducer = StoreMainPageIndexReducer();
      final newState =
          reducer.reducer(initialState, StoreMainPageIndexAction(2));

      expect(newState.mainPageIndex, 2);
    });
  });
  group('StorePodcastSummariesReducer', () {
    test('correctly stores summaries', () async {
      final initialState = AppState.init();
      expect(initialState.podcastSummaries, <PodcastSummary>[]);

      final summary = await getInTheDarkSummary();
      final reducer = StorePodcastSummariesReducer();
      final newState = reducer.reducer(
          initialState, StorePodcastSummariesAction([summary].lock));

      expect(newState.podcastSummaries.first, summary);
    });
  });
  group('StoreFeedReducer', () {
    test('correctly stores a feed', () async {
      final initialState = AppState.init();
      expect(initialState.detailVM, null);

      final feed = await getInTheDarkFeed();
      final reducer = StoreFeedReducer();
      final newState = reducer.reducer(initialState, StoreFeedAction(feed));

      expect(newState.detailVM!.feed, feed);
    });
  });

  group('StoreTrackReducer', () {
    test('correctly stores a track', () async {
      final initialState = AppState.init();
      expect(initialState.track, null);

      final track = in_the_dark_s2e18_track;
      final reducer = StoreTrackReducer();
      final newState = reducer.reducer(initialState, StoreTrackAction(track));

      expect(newState.track, track);
    });
  });

  group('StoreTrackStateReducer', () {
    test('sets the state for the current track', () async {
      final initialState =
          AppState.init().copyWith(track: in_the_dark_s2e18_track);
      expect(initialState.track!.state, TrackStateEnum.nothing);

      final reducer = StoreTrackStateReducer();
      final newState = reducer.reducer(
          initialState, StoreTrackStateAction(TrackStateEnum.loaded));

      expect(newState.track!.state, TrackStateEnum.loaded);
    });
  });

  group('StoreTrackDurationReducer', () {
    test('sets the duration for the current track', () async {
      final initialState =
          AppState.init().copyWith(track: in_the_dark_s2e18_track);
      expect(initialState.track!.duration, null);

      final reducer = StoreTrackDurationReducer();
      final newState =
          reducer.reducer(initialState, StoreTrackDurationAction(100.3));

      expect(newState.track!.duration, 100.3);
    });
  });

  group('StoreTrackPositionReducer', () {
    test(' sets the position for the current track', () async {
      final initialState =
          AppState.init().copyWith(track: in_the_dark_s2e18_track);
      expect(initialState.track!.position, null);

      final reducer = StoreTrackPositionReducer();
      final newState =
          reducer.reducer(initialState, StoreTrackPositionAction(33.4));

      expect(newState.track!.position, 33.4);
    });
  });
}
