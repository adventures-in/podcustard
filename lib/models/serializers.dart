import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:podcustard/models/podcast_detail_view_model.dart';
import 'package:podcustard/models/podcast_summary.dart';
import 'package:podcustard/models/problem.dart';
import 'package:podcustard/models/provider_info.dart';
import 'package:podcustard/models/track.dart';
import 'package:podcustard/models/user.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:rss_dart/models/media/content.dart';
import 'package:rss_dart/models/media/media.dart';
import 'package:rss_dart/models/rss_enclosure.dart';
import 'package:rss_dart/models/rss_feed.dart';
import 'package:rss_dart/models/rss_item.dart';

part 'serializers.g.dart';

/// Once per app, define a top level "Serializer" to gather together
/// all the generated serializers.
///
/// Collection of generated serializers for the Podcustard app
@SerializersFor([
  Problem,
  AppState,
  User,
  ProviderInfo,
  PodcastSummary,
  PodcastDetailViewModel,
  Track,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();
