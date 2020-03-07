import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/models/actions/add_problem.dart';
import 'package:podcustard/models/actions/store_track_state.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/models/track.dart';
import 'package:podcustard/services/audio_player_service.dart';

import '../../mocks/audio_player_service_mocks.dart';

void main() {
  group('Audio Player Service', () {
    // has a method that returns a stream that emits user

    test('provides a stream of objects', () async {
      final fakeAudioPlayerObject = FakeAudioPlayerObject();

      final service = AudioPlayerService(fakeAudioPlayerObject);

      // test that when fakeAudioPlayerObject.loadFromRemoteUrl()
      // errors the error comes through the stream
      service.loadWithUrl('onError');

      // service.streamOfAudioEvents.listen((event) {
      //   print(event);
      // });

      // Ignore lines from the process until it's about to emit the URL.
      // await expectLater(service.streamOfAudioEvents, emitsThrough());

      await expectLater(
        service.streamOfAudioEvents,
        emitsInOrder([
          StoreTrackState((b) => b..state = TrackStateEnum.loading),
          AddProblem((b) => b.problem
            ..message = 'errorString'
            ..type = ProblemTypeEnum.audioPlayerService_loadWithUrl_onError),
        ]),
      );

      // service.streamOfAudioEvents.listen(expectAsync1((action) {
      //   expect(action is Exception, true);
      //   print(action);
      // }, count: 2));
    });
  });
}
