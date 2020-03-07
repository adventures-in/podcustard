library build_track_from_episode;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import './redux_action.dart';
import '../serializers.dart';

part 'build_track_from_episode.g.dart';

abstract class BuildTrackFromEpisode extends Object
    with ReduxAction
    implements Built<BuildTrackFromEpisode, BuildTrackFromEpisodeBuilder> {
  String get audioUrl;
  String get episodeTitle;

  BuildTrackFromEpisode._();

  factory BuildTrackFromEpisode(
          [void Function(BuildTrackFromEpisodeBuilder) updates]) =
      _$BuildTrackFromEpisode;

  Object toJson() =>
      serializers.serializeWith(BuildTrackFromEpisode.serializer, this);

  static BuildTrackFromEpisode fromJson(String jsonString) =>
      serializers.deserializeWith(
          BuildTrackFromEpisode.serializer, json.decode(jsonString));

  static Serializer<BuildTrackFromEpisode> get serializer =>
      _$buildTrackFromEpisodeSerializer;
}
