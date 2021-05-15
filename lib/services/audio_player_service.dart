import 'dart:async';

import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:podcustard/actions/add_problem_action.dart';
import 'package:podcustard/actions/redux_action.dart';
import 'package:podcustard/actions/store_track_duration_action.dart';
import 'package:podcustard/actions/store_track_position_action.dart';
import 'package:podcustard/actions/store_track_state_action.dart';
import 'package:podcustard/enums/track_state_enum.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/services/wrappers/audio_player_wrapper.dart';

class AudioPlayerService {
  AudioPlayerService(this._audioPlayerWrapper) {
    _controller = StreamController<ReduxAction>();
  }

  /// this object just wraps the global static methods for easier testing
  final AudioPlayerWrapper _audioPlayerWrapper;

  /// the actual player object we get from the AudioPlayerObject wrapper
  Audio? _audio;

  /// a stream controller used to emit data events from the player
  late final StreamController<ReduxAction> _controller;

  /// a getter for the stream of data events from the player
  Stream<ReduxAction> get streamOfAudioEvents => _controller.stream;

  Future<void> loadWithUrl(String url) async {
    try {
      _controller.add(StoreTrackStateAction(TrackStateEnum.loading));
      _audio = _audioPlayerWrapper.loadFromRemoteUrl(url,
          onError: _onError,
          onDuration: _onDuration,
          onComplete: _onComplete,
          onPosition: _onPosition);
    } catch (error, trace) {
      _controller.add(
          AddProblemAction(Problem(error.toString(), trace: trace.toString())));
    }
  }

  Future<void> play([double? endpointSeconds]) async {
    try {
      await _audio?.play(endpointSeconds: endpointSeconds);
      _controller.add(StoreTrackStateAction(TrackStateEnum.playing));
    } catch (error, trace) {
      _controller.add(
          AddProblemAction(Problem(error.toString(), trace: trace.toString())));
    }
  }

  Future<void> pause([double? endpointSeconds]) async {
    try {
      await _audio?.pause();
      _controller.add(StoreTrackStateAction(TrackStateEnum.paused));
    } catch (error, trace) {
      _controller.add(
          AddProblemAction(Problem(error.toString(), trace: trace.toString())));
    }
  }

  Future<void> resume() async {
    try {
      await _audio?.resume();
      _controller.add(StoreTrackStateAction(TrackStateEnum.playing));
    } catch (error, trace) {
      _controller.add(
          AddProblemAction(Problem(error.toString(), trace: trace.toString())));
    }
  }

  void _onError(String? message) =>
      _controller.add(AddProblemAction(Problem(message ?? 'null')));
  void _onComplete() =>
      _controller.add(StoreTrackStateAction(TrackStateEnum.paused));
  void _onDuration(double duration) =>
      _controller.add(StoreTrackDurationAction(duration));
  void _onPosition(double position) =>
      _controller.add(StoreTrackPositionAction(position));
}
