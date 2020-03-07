library store_track_duration;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import './redux_action.dart';
import '../serializers.dart';

part 'store_track_duration.g.dart';

abstract class StoreTrackDuration extends Object
    with ReduxAction
    implements Built<StoreTrackDuration, StoreTrackDurationBuilder> {
  double get duration;

  StoreTrackDuration._();

  factory StoreTrackDuration(
          [void Function(StoreTrackDurationBuilder) updates]) =
      _$StoreTrackDuration;

  Object toJson() =>
      serializers.serializeWith(StoreTrackDuration.serializer, this);

  static StoreTrackDuration fromJson(String jsonString) => serializers
      .deserializeWith(StoreTrackDuration.serializer, json.decode(jsonString));

  static Serializer<StoreTrackDuration> get serializer =>
      _$storeTrackDurationSerializer;
}
