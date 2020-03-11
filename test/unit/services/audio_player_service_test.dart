import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/models/actions/add_problem.dart';
import 'package:podcustard/models/actions/store_track_duration.dart';
import 'package:podcustard/models/actions/store_track_position.dart';
import 'package:podcustard/models/actions/store_track_state.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/models/track.dart';
import 'package:podcustard/services/audio_player_service.dart';

import '../../mocks/audio_player_service_mocks.dart';

void main() {
  group('Audio Player Service', () {
    test('audio events stream emits error if AudioPlayerObject calls onError',
        () async {
      final fakeAudioPlayerObject =
          FakeAudioPlayerObject(callOnError: true, errorString: 'error string');
      final service = AudioPlayerService(fakeAudioPlayerObject);

      // test that when fakeAudioPlayerObject.loadFromRemoteUrl()
      // calls the onError callback the error comes through the stream
      service.loadWithUrl('url');

      await expectLater(
        service.streamOfAudioEvents,
        emitsInOrder([
          StoreTrackState((b) => b..state = TrackStateEnum.loading),
          AddProblem((b) => b.problem
            ..message = 'error string'
            ..type = ProblemTypeEnum.audioPlayerService_loadWithUrl_onError),
        ]),
      );
    });

    test(
        'audio events stream emits when onDuration, onPosition, onComplete are called by AudioPlayerObject',
        () async {
      final fakeAudioPlayerObject = FakeAudioPlayerObject(
          callOnDuration: true,
          callOnPosition: true,
          callOnComplete: true,
          duration: 1.0,
          position: 0.5);
      final service = AudioPlayerService(fakeAudioPlayerObject);

      // test that when fakeAudioPlayerObject.loadFromRemoteUrl()
      // is called the callbacks comes through the stream
      service.loadWithUrl('url');

      await expectLater(
        service.streamOfAudioEvents,
        emitsInOrder([
          StoreTrackState((b) => b..state = TrackStateEnum.loading),
          StoreTrackDuration((b) => b..duration = 1.0),
          StoreTrackPosition((b) => b..position = 0.5),
        ]),
      );
    });
  });
}
