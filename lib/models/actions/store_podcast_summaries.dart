library store_podcast_summaries;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import './redux_action.dart';
import '../podcast_summary.dart';
import '../serializers.dart';

part 'store_podcast_summaries.g.dart';

abstract class StorePodcastSummaries extends Object
    with ReduxAction
    implements Built<StorePodcastSummaries, StorePodcastSummariesBuilder> {
  BuiltList<PodcastSummary> get summaries;

  StorePodcastSummaries._();

  factory StorePodcastSummaries(
          [void Function(StorePodcastSummariesBuilder) updates]) =
      _$StorePodcastSummaries;

  Object toJson() =>
      serializers.serializeWith(StorePodcastSummaries.serializer, this);

  static StorePodcastSummaries fromJson(String jsonString) =>
      serializers.deserializeWith(
          StorePodcastSummaries.serializer, json.decode(jsonString));

  static Serializer<StorePodcastSummaries> get serializer =>
      _$storePodcastSummariesSerializer;
}
