library track;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:podcustard/models/serializers.dart';

part 'track.g.dart';

abstract class Track implements Built<Track, TrackBuilder> {
  String get episode;
  String get author;
  String get audioUrl;
  String get imageUrl;
  TrackStateEnum get state;
  @nullable
  double get duration;
  @nullable
  double get position;

  Track._();

  factory Track([void Function(TrackBuilder) updates]) = _$Track;

  Object toJson() => serializers.serializeWith(Track.serializer, this);

  static Track fromJson(String jsonString) =>
      serializers.deserializeWith(Track.serializer, json.decode(jsonString));

  static Serializer<Track> get serializer => _$trackSerializer;
}

/// Enum for track state (playing, paused, loading)
class TrackStateEnum extends EnumClass {
  static Serializer<TrackStateEnum> get serializer =>
      _$trackStateEnumSerializer;

  static const TrackStateEnum playing = _$playing;
  static const TrackStateEnum paused = _$paused;
  static const TrackStateEnum loading = _$loading;
  static const TrackStateEnum loaded = _$loaded;

  const TrackStateEnum._(String name) : super(name);

  static BuiltSet<TrackStateEnum> get values => _$values;
  static TrackStateEnum valueOf(String name) => _$valueOf(name);
}
