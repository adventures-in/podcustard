import 'package:freezed_annotation/freezed_annotation.dart';

/// Enum for track state (playing, paused, loading)
enum TrackStateEnum {
  @JsonValue('PLAYING')
  playing,
  @JsonValue('PAUSED')
  paused,
  @JsonValue('LOADING')
  loading,
  @JsonValue('LOADED')
  loaded,
  @JsonValue('NOTHING')
  nothing
}
