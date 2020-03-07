library retrieve_podcast_summaries;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import './redux_action.dart';
import '../serializers.dart';

part 'retrieve_podcast_summaries.g.dart';

abstract class RetrievePodcastSummaries extends Object
    with ReduxAction
    implements
        Built<RetrievePodcastSummaries, RetrievePodcastSummariesBuilder> {
  String get query;

  RetrievePodcastSummaries._();

  factory RetrievePodcastSummaries(
          [void Function(RetrievePodcastSummariesBuilder) updates]) =
      _$RetrievePodcastSummaries;

  Object toJson() =>
      serializers.serializeWith(RetrievePodcastSummaries.serializer, this);

  static RetrievePodcastSummaries fromJson(String jsonString) =>
      serializers.deserializeWith(
          RetrievePodcastSummaries.serializer, json.decode(jsonString));

  static Serializer<RetrievePodcastSummaries> get serializer =>
      _$retrievePodcastSummariesSerializer;
}
