import 'package:audiofileplayer/audiofileplayer.dart';

class AudioPlayerObject {
  AudioPlayerObject();

  Audio loadFromRemoteUrl(String url,
      {void Function(String) onError,
      void Function() onComplete,
      void Function(double) onDuration,
      void Function(double) onPosition}) {
    return Audio.loadFromRemoteUrl(
      url,
      onError: onError,
      onComplete: onComplete,
      onDuration: onDuration,
      onPosition: onPosition,
    );
  }
}
