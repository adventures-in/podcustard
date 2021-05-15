import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:podcustard/services/wrappers/audio_player_wrapper.dart';

class FakeAudioPlayersWrapper implements AudioPlayerWrapper {
  @override
  Audio? loadFromRemoteUrl(String url,
      {void Function(String? p1)? onError,
      void Function()? onComplete,
      void Function(double p1)? onDuration,
      void Function(double p1)? onPosition}) {
    throw UnimplementedError();
  }
}
