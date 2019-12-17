library app_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/models/user.dart';
import 'package:podcustard/redux/serializers.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  BuiltList<Problem> get problems;
  @nullable
  User get user;

  AppState._();

  factory AppState([void updates(AppStateBuilder b)]) = _$AppState;

  Object toJson() => serializers.serializeWith(AppState.serializer, this);

  static AppState fromJson(String jsonString) =>
      serializers.deserializeWith(AppState.serializer, json.decode(jsonString));

  factory AppState.init() =>
      AppState((a) => a..problems = ListBuilder<Problem>());

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
