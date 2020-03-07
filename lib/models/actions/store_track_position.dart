library store_track_position;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import './redux_action.dart';
import '../serializers.dart';

part 'store_track_position.g.dart';

abstract class StoreTrackPosition extends Object
    with ReduxAction
    implements Built<StoreTrackPosition, StoreTrackPositionBuilder> {
  double get position;

  StoreTrackPosition._();

  factory StoreTrackPosition(
          [void Function(StoreTrackPositionBuilder) updates]) =
      _$StoreTrackPosition;

  Object toJson() =>
      serializers.serializeWith(StoreTrackPosition.serializer, this);

  static StoreTrackPosition fromJson(String jsonString) => serializers
      .deserializeWith(StoreTrackPosition.serializer, json.decode(jsonString));

  static Serializer<StoreTrackPosition> get serializer =>
      _$storeTrackPositionSerializer;
}
