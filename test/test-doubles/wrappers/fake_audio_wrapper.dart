import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:podcustard/plugins/wrappers/audio_wrapper.dart';

class FakeAudioWrapper implements AudioWrapper {
  @override
  Audio? loadFromRemoteUrl(String url,
      {void Function(String? p1)? onError,
      void Function()? onComplete,
      void Function(double p1)? onDuration,
      void Function(double p1)? onPosition}) {
    throw UnimplementedError();
  }
}
