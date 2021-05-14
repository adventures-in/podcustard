import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/actions/add_problem_action.dart';
import 'package:podcustard/actions/store_track_duration_action.dart';
import 'package:podcustard/actions/store_track_position_action.dart';
import 'package:podcustard/actions/store_track_state_action.dart';
import 'package:podcustard/enums/track_state_enum.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/services/audio_player_service.dart';

import '../../test-doubles/services/audio_player_service_mocks.dart';

void main() {
  group('Audio Player Service', () {
    test('audio events stream emits error if AudioPlayerObject calls onError',
        () async {
      final fakeAudioPlayerObject =
          FakeAudioPlayerObject(callOnError: true, errorString: 'error string');
      final service = AudioPlayerService(fakeAudioPlayerObject);

      // test that when fakeAudioPlayerObject.loadFromRemoteUrl()
      // calls the onError callback the error comes through the stream
      await service.loadWithUrl('url');

      await expectLater(
          service.streamOfAudioEvents,
          emitsInOrder(<dynamic>[
            StoreTrackStateAction(TrackStateEnum.loading),
            AddProblemAction(Problem(message: 'error string'))
          ]));
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
      await service.loadWithUrl('url');

      await expectLater(
        service.streamOfAudioEvents,
        emitsInOrder(<dynamic>[
          StoreTrackStateAction(TrackStateEnum.loading),
          StoreTrackDurationAction(1.0),
          StoreTrackPositionAction(0.5),
        ]),
      );
    });
  });
}
