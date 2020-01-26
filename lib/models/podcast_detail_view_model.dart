library podcast_detail_view_model;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:podcustard/models/podcast_summary.dart';
import 'package:podcustard/models/serializers.dart';
import 'package:rss_dart/models/rss_feed.dart';

part 'podcast_detail_view_model.g.dart';

abstract class PodcastDetailViewModel
    implements Built<PodcastDetailViewModel, PodcastDetailViewModelBuilder> {
  PodcastSummary get summary;
  @nullable
  RssFeed get feed;

  PodcastDetailViewModel._();

  factory PodcastDetailViewModel(
          [void Function(PodcastDetailViewModelBuilder) updates]) =
      _$PodcastDetailViewModel;

  Object toJson() =>
      serializers.serializeWith(PodcastDetailViewModel.serializer, this);

  static PodcastDetailViewModel fromJson(String jsonString) =>
      serializers.deserializeWith(
          PodcastDetailViewModel.serializer, json.decode(jsonString));

  static Serializer<PodcastDetailViewModel> get serializer =>
      _$podcastDetailViewModelSerializer;
}
