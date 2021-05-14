import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/enums/track_state_enum.dart';

part 'track.freezed.dart';
part 'track.g.dart';

@freezed
class Track with _$Track {
  factory Track({
    required String episode,
    required String author,
    required String audioUrl,
    required String imageUrl,
    required TrackStateEnum state,
    double? duration,
    double? position,
  }) = _Track;

  factory Track.fromJson(Map<String, Object?> json) => _$TrackFromJson(json);
}
