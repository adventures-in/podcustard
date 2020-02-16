import 'dart:async';

import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:podcustard/models/actions.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/models/track.dart';
import 'package:podcustard/utils/audio_player_object.dart';

class AudioPlayerService {
  AudioPlayerService(this._audioPlayerObject) {
    _controller = StreamController<Action>();
  }

  /// this object just wraps the global static methods for easier testing
  final AudioPlayerObject _audioPlayerObject;

  /// the actual player object we get from the AudioPlayerObject wrapper
  Audio _audio;

  /// a stream controller used to emit data events from the player
  StreamController<Action> _controller;

  /// a getter for the stream of data events from the player
  Stream<Action> get streamOfActions => _controller.stream;

  Future<void> loadWithUrl(String url) async {
    try {
      _controller.add(StoreTrackState(state: TrackStateEnum.loading));
      _audio = await _audioPlayerObject.loadFromRemoteUrl(url,
          onError: _onError,
          onDuration: _onDuration,
          onComplete: _onComplete,
          onPosition: _onPosition);
      _controller.add(StoreTrackState(state: TrackStateEnum.loaded));
    } catch (error, trace) {
      _controller.add(AddProblem(
          problem: Problem(
        (b) => b
          ..message = error.toString()
          ..trace = trace.toString()
          ..type = ProblemTypeEnum.audioPlayerService_loadWithUrl,
      )));
    }
  }

  Future<void> play([double endpointSeconds]) async {
    try {
      await _audio.play(endpointSeconds);
      _controller.add(StoreTrackState(state: TrackStateEnum.playing));
    } catch (error, trace) {
      _controller.add(AddProblem(
          problem: Problem(
        (b) => b
          ..message = error.toString()
          ..trace = trace.toString()
          ..type = ProblemTypeEnum.audioPlayerService_play,
      )));
    }
  }

  Future<void> pause([double endpointSeconds]) async {
    try {
      await _audio.pause();
      _controller.add(StoreTrackState(state: TrackStateEnum.paused));
    } catch (error, trace) {
      _controller.add(AddProblem(
          problem: Problem(
        (b) => b
          ..message = error.toString()
          ..trace = trace.toString()
          ..type = ProblemTypeEnum.audioPlayerService_pause,
      )));
    }
  }

  Future<void> resume() async {
    try {
      await _audio.resume();
      _controller.add(StoreTrackState(state: TrackStateEnum.playing));
    } catch (error, trace) {
      _controller.add(AddProblem(
          problem: Problem(
        (b) => b
          ..message = error.toString()
          ..trace = trace.toString()
          ..type = ProblemTypeEnum.audioPlayerService_resume,
      )));
    }
  }

  void _onError(String message) => _controller.add(AddProblem(
      problem: Problem((b) => b
        ..message = message
        ..type = ProblemTypeEnum.audioPlayerService_loadWithUrl_onError)));
  void _onComplete() =>
      _controller.add(Action.StoreTrackState(state: TrackStateEnum.paused));
  void _onDuration(double duration) =>
      _controller.add(Action.StoreTrackDuration(duration: duration));
  void _onPosition(double position) =>
      _controller.add(Action.StoreTrackPosition(position: position));
}
