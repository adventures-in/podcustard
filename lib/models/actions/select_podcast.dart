library select_podcast;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:podcustard/models/podcast_summary.dart';

import './redux_action.dart';
import '../serializers.dart';

part 'select_podcast.g.dart';

abstract class SelectPodcast extends Object
    with ReduxAction
    implements Built<SelectPodcast, SelectPodcastBuilder> {
  PodcastSummary get selection;

  SelectPodcast._();

  factory SelectPodcast([void Function(SelectPodcastBuilder) updates]) =
      _$SelectPodcast;

  Object toJson() => serializers.serializeWith(SelectPodcast.serializer, this);

  static SelectPodcast fromJson(String jsonString) => serializers
      .deserializeWith(SelectPodcast.serializer, json.decode(jsonString));

  static Serializer<SelectPodcast> get serializer => _$selectPodcastSerializer;
}
