import 'dart:async';

import 'package:mockito/mockito.dart';
import 'package:podcustard/actions/build_track_from_episode_action.dart';
import 'package:podcustard/actions/observe_audio_player_action.dart';
import 'package:podcustard/actions/pause_track_action.dart';
import 'package:podcustard/actions/resume_track_action.dart';
import 'package:podcustard/actions/retrieve_podcast_summaries_action.dart';
import 'package:podcustard/actions/select_podcast_action.dart';
import 'package:podcustard/actions/store_track_action.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:podcustard/services/itunes_service.dart';
import 'package:redfire/types.dart';
import 'package:test/test.dart';

import '../test-data/feed_test_data.dart';
import '../test-data/podcast_summary_data.dart';
import '../test-data/track_test_data.dart';
import '../test-doubles/services/audio_player_service_mocks.dart';
import '../test-doubles/services/feeds_service_mocks.dart';

void main() {
  group('Middleware', () {
    test('_retrievePodcastSummaries uses service to retrieve summaries',
        () async {
      // setup a mock service to give a test response
      final fakedOutService = ItunesService(
          FakeHttpClient(response: summaries_json_response_string));

      final store = FakedOutStore(iTunesService: fakedOutService);

      // dispatch action to initiate signin
      await store.dispatch(RetrievePodcastSummariesAction('query'));

      // mut dispatches a StorePodcastSummaries action so we check the state
      expect(store.state.podcastSummaries.length, 50);
    });

    test('_retrieveFeed retrieves and parses the feed', () async {
      // setup a mock service to give a test response
      final fakedOutService =
          FeedsService(FakeHttpClient(response: in_the_dark_feed));

      final store = FakedOutStore(feedsService: fakedOutService);

      final summary = await getInTheDarkSummary();

      // dispatch action to initiate retrieving the feed
      await store.dispatch(SelectPodcastAction(summary));

      final feed = await getInTheDarkFeed();

      // mut dispatches a StoreFeed action so we check the state
      expect(store.state.detailVM!.feed, feed);
    });

    test('_observeAudioPlayer listens to audio service and dispatches',
        () async {
      // setup a mock service to give a test response
      final controller = StreamController<ReduxAction>();
      final fakeService = FakeAudioPlayerService(controller);

      final store = FakedOutStore(audioPlayerService: fakeService);

      // trigger the _observeAudioPlayer function (ie. the sut)
      store.dispatch(ObserveAudioPlayerAction());

      // create a test data object
      final track = in_the_dark_s2e18_track;

      // push an action into the stream
      controller.add(StoreTrackAction(track));

      // check that action emitted by service produced expected state
      expect(store.state.track, track);
    });

    test('_buildTrackFromEpisode loads and plays the track', () async {
      // setup a mock service to give a test response
      final controller = StreamController<ReduxAction>();

      final store = FakedOutStore(
          feedsService: FakeFeedsService(),
          audioPlayerService: FakeAudioPlayerService(controller));

      final summary = await getInTheDarkSummary();

      store.dispatch(SelectPodcastAction(summary));

      final track = in_the_dark_s2e18_track;

      store
          .dispatch(BuildTrackFromEpisodeAction(track.audioUrl, track.episode));

      // check that action emitted by service produced expected state
      expect(store.state.track, track);
    });

    test('_pauseTrack pauses the track and stores state', () async {
      // setup a mock service to give a test response
      final controller = StreamController<ReduxAction>();
      final service = FakeAudioPlayerService(controller);

      final store = FakedOutStore(
          audioPlayerService: service, feedsService: FakeFeedsService());

      // add a track to the app state
      final summary = await getInTheDarkSummary();
      final track = in_the_dark_s2e18_track;
      store.dispatch(SelectPodcastAction(summary));
      store
          .dispatch(BuildTrackFromEpisodeAction(track.audioUrl, track.episode));

      store.dispatch(PauseTrackAction());

      // check that the action resulted in the service being called
      expect(service.pausedCount, 1);
    });

    test('_resumeTrack resumes the track and sets state', () async {
      // setup a mock service to give a test response
      final controller = StreamController<ReduxAction>();
      final service = FakeAudioPlayerService(controller);

      final store = FakedOutStore(
          audioPlayerService: service, feedsService: FakeFeedsService());

      // add a track to the app state
      final summary = await getInTheDarkSummary();
      final track = in_the_dark_s2e18_track;
      store.dispatch(SelectPodcastAction(summary));
      store
          .dispatch(BuildTrackFromEpisodeAction(track.audioUrl, track.episode));

      store.dispatch(ResumeTrackAction());

      // check that the action resulted in the service being called
      expect(service.resumedCount, 1);
    });
  });
}
