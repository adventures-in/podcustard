library store_theme_mode;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import './redux_action.dart';
import '../serializers.dart';

part 'store_theme_mode.g.dart';

abstract class StoreThemeMode extends Object
    with ReduxAction
    implements Built<StoreThemeMode, StoreThemeModeBuilder> {
  int get themeMode;

  StoreThemeMode._();

  factory StoreThemeMode([void Function(StoreThemeModeBuilder) updates]) =
      _$StoreThemeMode;

  Object toJson() => serializers.serializeWith(StoreThemeMode.serializer, this);

  static StoreThemeMode fromJson(String jsonString) => serializers
      .deserializeWith(StoreThemeMode.serializer, json.decode(jsonString));

  static Serializer<StoreThemeMode> get serializer =>
      _$storeThemeModeSerializer;
}
