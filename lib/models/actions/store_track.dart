library store_track;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import './redux_action.dart';
import '../serializers.dart';
import '../track.dart';

part 'store_track.g.dart';

abstract class StoreTrack extends Object
    with ReduxAction
    implements Built<StoreTrack, StoreTrackBuilder> {
  Track get track;

  StoreTrack._();

  factory StoreTrack([void Function(StoreTrackBuilder) updates]) = _$StoreTrack;

  Object toJson() => serializers.serializeWith(StoreTrack.serializer, this);

  static StoreTrack fromJson(String jsonString) => serializers.deserializeWith(
      StoreTrack.serializer, json.decode(jsonString));

  static Serializer<StoreTrack> get serializer => _$storeTrackSerializer;
}
