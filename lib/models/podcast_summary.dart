library podcast_summary;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:podcustard/models/serializers.dart';

part 'podcast_summary.g.dart';

abstract class PodcastSummary
    implements Built<PodcastSummary, PodcastSummaryBuilder> {
  @nullable
  int get artistId;
  @nullable
  int get collectionId;
  @nullable
  int get trackId;
  @nullable
  int get trackCount;
  @nullable
  DateTime get releaseDate;
  @nullable
  String get artistName;
  @nullable
  String get collectionName;
  @nullable
  String get trackName;
  @nullable
  String get artistViewUrl;
  @nullable
  String get collectionViewUrl;
  @nullable
  String get feedUrl;
  @nullable
  String get trackViewUrl;
  @nullable
  String get artworkUrl30;
  @nullable
  String get artworkUrl60;
  @nullable
  String get artworkUrl100;
  @nullable
  String get artworkUrl600;
  @nullable
  String get country;
  @nullable
  String get primaryGenreName;
  BuiltList<String> get genreIds;
  BuiltList<String> get genres;

  PodcastSummary._();

  factory PodcastSummary([void Function(PodcastSummaryBuilder) updates]) =
      _$PodcastSummary;

  Object toJson() => serializers.serializeWith(PodcastSummary.serializer, this);

  static PodcastSummary fromJson(String jsonString) => serializers
      .deserializeWith(PodcastSummary.serializer, json.decode(jsonString));

  static Serializer<PodcastSummary> get serializer =>
      _$podcastSummarySerializer;
}
