library store_track_state;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:podcustard/models/track.dart';

import './redux_action.dart';
import '../serializers.dart';

part 'store_track_state.g.dart';

abstract class StoreTrackState extends Object
    with ReduxAction
    implements Built<StoreTrackState, StoreTrackStateBuilder> {
  TrackStateEnum get state;

  StoreTrackState._();

  factory StoreTrackState([void Function(StoreTrackStateBuilder) updates]) =
      _$StoreTrackState;

  Object toJson() =>
      serializers.serializeWith(StoreTrackState.serializer, this);

  static StoreTrackState fromJson(String jsonString) => serializers
      .deserializeWith(StoreTrackState.serializer, json.decode(jsonString));

  static Serializer<StoreTrackState> get serializer =>
      _$storeTrackStateSerializer;
}
