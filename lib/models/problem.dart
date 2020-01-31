library problem;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/serializers.dart';

part 'problem.g.dart';

abstract class Problem implements Built<Problem, ProblemBuilder> {
  ProblemTypeEnum get type;
  String get message;
  @nullable
  String get trace;
  @nullable
  AppState get state;
  @nullable
  Map<String, dynamic> get info;

  Problem._();

  factory Problem([void Function(ProblemBuilder) updates]) = _$Problem;

  Object toJson() => serializers.serializeWith(Problem.serializer, this);

  static Problem fromJson(String jsonString) =>
      serializers.deserializeWith(Problem.serializer, json.decode(jsonString));

  static Serializer<Problem> get serializer => _$problemSerializer;
}

class ProblemTypeEnum extends EnumClass {
  static Serializer<ProblemTypeEnum> get serializer =>
      _$problemTypeEnumSerializer;

  static const ProblemTypeEnum googleSignin = _$googleSignin;
  static const ProblemTypeEnum appleSignin = _$appleSignin;
  static const ProblemTypeEnum retrievePodcastSummaries =
      _$retrievePodcastSummaries;
  static const ProblemTypeEnum audioPlayerService_loadWithUrl =
      _$audioPlayerService_loadWithUrl;
  static const ProblemTypeEnum audioPlayerService_play =
      _$audioPlayerService_play;
  static const ProblemTypeEnum audioPlayerService_loadWithUrl_onError =
      _$audioPlayerService_loadWithUrl_onError;

  const ProblemTypeEnum._(String name) : super(name);

  static BuiltSet<ProblemTypeEnum> get values => _$values;
  static ProblemTypeEnum valueOf(String name) => _$valueOf(name);
}
