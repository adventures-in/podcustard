library store_feed;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rss_dart/models/rss_feed.dart';

import './redux_action.dart';
import '../serializers.dart';

part 'store_feed.g.dart';

abstract class StoreFeed extends Object
    with ReduxAction
    implements Built<StoreFeed, StoreFeedBuilder> {
  RssFeed get feed;

  StoreFeed._();

  factory StoreFeed([void Function(StoreFeedBuilder) updates]) = _$StoreFeed;

  Object toJson() => serializers.serializeWith(StoreFeed.serializer, this);

  static StoreFeed fromJson(String jsonString) => serializers.deserializeWith(
      StoreFeed.serializer, json.decode(jsonString));

  static Serializer<StoreFeed> get serializer => _$storeFeedSerializer;
}
