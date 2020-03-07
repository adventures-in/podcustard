import 'dart:async';

import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:podcustard/models/actions/add_problem.dart';
import 'package:podcustard/models/actions/redux_action.dart';
import 'package:podcustard/models/actions/store_track_duration.dart';
import 'package:podcustard/models/actions/store_track_position.dart';
import 'package:podcustard/models/actions/store_track_state.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/models/track.dart';
import 'package:podcustard/utils/audio_player_object.dart';

class AudioPlayerService {
  AudioPlayerService(this._audioPlayerObject) {
    _controller = StreamController<ReduxAction>();
  }

  /// this object just wraps the global static methods for easier testing
  final AudioPlayerObject _audioPlayerObject;

  /// the actual player object we get from the AudioPlayerObject wrapper
  Audio _audio;

  /// a stream controller used to emit data events from the player
  StreamController<ReduxAction> _controller;

  /// a getter for the stream of data events from the player
  Stream<ReduxAction> get streamOfAudioEvents => _controller.stream;

  void loadWithUrl(String url) async {
    try {
      _controller
          .add(StoreTrackState((b) => b..state = TrackStateEnum.loading));
      _audio = _audioPlayerObject.loadFromRemoteUrl(url,
          onError: _onError,
          onDuration: _onDuration,
          onComplete: _onComplete,
          onPosition: _onPosition);
    } catch (error, trace) {
      _controller.add(AddProblem(
        (b) => b.problem
          ..message = error.toString()
          ..trace = trace?.toString()
          ..type = ProblemTypeEnum.audioPlayerService_loadWithUrl,
      ));
    }
  }

  Future<void> play([double endpointSeconds]) async {
    try {
      await _audio.play(endpointSeconds);
      _controller
          .add(StoreTrackState((b) => b..state = TrackStateEnum.playing));
    } catch (error, trace) {
      _controller.add(AddProblem(
        (b) => b.problem
          ..message = error.toString()
          ..trace = trace?.toString()
          ..type = ProblemTypeEnum.audioPlayerService_play,
      ));
    }
  }

  Future<void> pause([double endpointSeconds]) async {
    try {
      await _audio.pause();
      _controller.add(StoreTrackState((b) => b..state = TrackStateEnum.paused));
    } catch (error, trace) {
      _controller.add(AddProblem(
        (b) => b.problem
          ..message = error.toString()
          ..trace = trace?.toString()
          ..type = ProblemTypeEnum.audioPlayerService_pause,
      ));
    }
  }

  Future<void> resume() async {
    try {
      await _audio.resume();
      _controller
          .add(StoreTrackState((b) => b..state = TrackStateEnum.playing));
    } catch (error, trace) {
      _controller.add(AddProblem(
        (b) => b.problem
          ..message = error.toString()
          ..trace = trace?.toString()
          ..type = ProblemTypeEnum.audioPlayerService_resume,
      ));
    }
  }

  void _onError(String message) => _controller.add(AddProblem((b) => b.problem
    ..message = message
    ..type = ProblemTypeEnum.audioPlayerService_loadWithUrl_onError));
  void _onComplete() =>
      _controller.add(StoreTrackState((b) => b..state = TrackStateEnum.paused));
  void _onDuration(double duration) =>
      _controller.add(StoreTrackDuration((b) => b..duration = duration));
  void _onPosition(double position) =>
      _controller.add(StoreTrackPosition((b) => b..position = position));
}
