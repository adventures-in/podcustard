library resume_track;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import './redux_action.dart';
import '../serializers.dart';

part 'resume_track.g.dart';

abstract class ResumeTrack extends Object
    with ReduxAction
    implements Built<ResumeTrack, ResumeTrackBuilder> {
  ResumeTrack._();

  factory ResumeTrack([void Function(ResumeTrackBuilder) updates]) =
      _$ResumeTrack;

  Object toJson() => serializers.serializeWith(ResumeTrack.serializer, this);

  static ResumeTrack fromJson(String jsonString) => serializers.deserializeWith(
      ResumeTrack.serializer, json.decode(jsonString));

  static Serializer<ResumeTrack> get serializer => _$resumeTrackSerializer;
}
