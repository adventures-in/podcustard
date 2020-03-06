

import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/services/audio_player_service.dart';
import 'package:podcustard/utils/audio_player_object.dart';

void main() {
  group('Audio Player Service', () {
    // has a method that returns a stream that emits user

    test('provides a stream of  objects', () {

      final playerObject = AudioPlayerObject();
      final service = AudioPlayerService(playerObject);

      service.streamOfStateChanges.listen(expectAsync1((action) {
        expect(action is StoreUser, true);
      }, count: 2));
    });
}
