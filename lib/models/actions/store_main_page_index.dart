library store_main_page_index;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import './redux_action.dart';
import '../serializers.dart';

part 'store_main_page_index.g.dart';

abstract class StoreMainPageIndex extends Object
    with ReduxAction
    implements Built<StoreMainPageIndex, StoreMainPageIndexBuilder> {
  int get index;

  StoreMainPageIndex._();

  factory StoreMainPageIndex(
          [void Function(StoreMainPageIndexBuilder) updates]) =
      _$StoreMainPageIndex;

  Object toJson() =>
      serializers.serializeWith(StoreMainPageIndex.serializer, this);

  static StoreMainPageIndex fromJson(String jsonString) => serializers
      .deserializeWith(StoreMainPageIndex.serializer, json.decode(jsonString));

  static Serializer<StoreMainPageIndex> get serializer =>
      _$storeMainPageIndexSerializer;
}
