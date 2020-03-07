import 'dart:async';

import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:mockito/mockito.dart';
import 'package:podcustard/models/actions/redux_action.dart';
import 'package:podcustard/services/audio_player_service.dart';
import 'package:podcustard/utils/audio_player_object.dart';

class FakeAudioPlayerService extends Fake implements AudioPlayerService {
  FakeAudioPlayerService({this.controller});

  /// a stream controller used to emit data events from the player
  StreamController<ReduxAction> controller;

  String loadedUrl;
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
  Future<void> play([double endpointSeconds]) {
    playedCount++;
    return Future.value(null);
  }

  @override
  Future<void> pause([double endpointSeconds]) {
    pausedCount++;
    return Future.value(null);
  }

  @override
  Future<void> resume() {
    resumedCount++;
    return Future.value(null);
  }
}

class FakeAudioPlayerObject extends Fake implements AudioPlayerObject {
  FakeAudioPlayerObject();

  int loadCount = 0;

  @override
  Audio loadFromRemoteUrl(String url,
      {void Function(String) onError,
      void Function() onComplete,
      void Function(double) onDuration,
      void Function(double) onPosition}) {
    loadCount++;
    if (url == 'onError') onError('errorString');
    if (url == 'onComplete') onComplete();
    if (url == 'onDuration') onDuration(1.0);
    if (url == 'onPosition') onPosition(0.5);
    return FakeAudio();
  }
}

class FakeAudio extends Fake implements Audio {
  FakeAudio();

  int playedCount = 0;
  int pausedCount = 0;
  int resumedCount = 0;

  @override
  Future<void> play([double endpointSeconds]) {
    playedCount++;
    return Future.value();
  }

  @override
  Future<void> pause() {
    pausedCount++;
    return Future.value();
  }
}
