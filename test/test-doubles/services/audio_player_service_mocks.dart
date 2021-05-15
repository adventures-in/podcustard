import 'dart:async';

import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:mockito/mockito.dart';
import 'package:podcustard/actions/redux_action.dart';
import 'package:podcustard/services/audio_player_service.dart';
import 'package:podcustard/services/wrappers/audio_player_wrapper.dart';

class FakeAudioPlayerService extends Fake implements AudioPlayerService {
  FakeAudioPlayerService(this.controller);

  /// a stream controller used to emit data events from the player
  StreamController<ReduxAction> controller;

  String? loadedUrl;
  int playedCount = 0;
  int pausedCount = 0;
  int resumedCount = 0;

  /// a getter for the stream of data events from the player
  @override
  Stream<ReduxAction> get streamOfAudioEvents => controller.stream;

  @override
  Future<void> loadWithUrl(String url) {
    loadedUrl = url;
    return Future.value(null);
  }

  @override
  Future<void> play([double? endpointSeconds]) {
    playedCount++;
    return Future.value(null);
  }

  @override
  Future<void> pause([double? endpointSeconds]) {
    pausedCount++;
    return Future.value(null);
  }

  @override
  Future<void> resume() {
    resumedCount++;
    return Future.value(null);
  }
}

/// The FakeAudioPlayerObject allows passing arguments that will
/// call the callbacks that are passed in to loadFromRemoteUrl
/// and would be called by the Audio object on the corresponding events
class FakeAudioPlayerObject extends Fake implements AudioPlayerWrapper {
  FakeAudioPlayerObject(
      {this.callOnError,
      this.callOnDuration,
      this.callOnPosition,
      this.callOnComplete,
      this.errorString,
      this.position,
      this.duration});

  bool? callOnError;
  bool? callOnDuration;
  bool? callOnPosition;
  bool? callOnComplete;
  String? errorString;
  double? duration;
  double? position;
  int loadCount = 0;

  @override
  Audio loadFromRemoteUrl(String url,
      {void Function(String?)? onError,
      void Function()? onComplete,
      void Function(double)? onDuration,
      void Function(double)? onPosition}) {
    loadCount++;
    if (callOnError != null && onError != null) onError(errorString);
    if (callOnDuration != null && onDuration != null && duration != null) {
      onDuration(duration!);
    }
    if (callOnPosition != null && onPosition != null && position != null) {
      onPosition(position!);
    }
    if (callOnComplete != null && onComplete != null) onComplete();
    return FakeAudio();
  }
}

class FakeAudio extends Fake implements Audio {
  FakeAudio();

  int playedCount = 0;
  int pausedCount = 0;
  int resumedCount = 0;

  @override
  Future<void> play({double? endpointSeconds}) {
    playedCount++;
    return Future.value();
  }

  @override
  Future<void> pause() {
    pausedCount++;
    return Future.value();
  }
}
