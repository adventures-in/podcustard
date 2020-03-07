library pause_track;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import './redux_action.dart';
import '../serializers.dart';

part 'pause_track.g.dart';

abstract class PauseTrack extends Object
    with ReduxAction
    implements Built<PauseTrack, PauseTrackBuilder> {
  PauseTrack._();

  factory PauseTrack([void Function(PauseTrackBuilder) updates]) = _$PauseTrack;

  Object toJson() => serializers.serializeWith(PauseTrack.serializer, this);

  static PauseTrack fromJson(String jsonString) => serializers.deserializeWith(
      PauseTrack.serializer, json.decode(jsonString));

  static Serializer<PauseTrack> get serializer => _$pauseTrackSerializer;
}
