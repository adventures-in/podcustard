import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/extensions/extensions.dart';
import 'package:podcustard/models/rss/rss_item.dart';
import 'package:xml/xml.dart';

part 'rss_feed.freezed.dart';
part 'rss_feed.g.dart';

@freezed
class RssFeed with _$RssFeed {
  factory RssFeed({
    required String title,
    String? author,
    required String description,
    required String link,
    required IList<RssItem> items,
  }) = _RssFeed;

  factory RssFeed.fromJson(Map<String, dynamic> json) =>
      _$RssFeedFromJson(json);

  factory RssFeed.parse(String xmlString) {
    var document = XmlDocument.parse(xmlString);
    XmlElement channelElement;
    try {
      channelElement = document.findAllElements('channel').first;
    } on StateError {
      throw ArgumentError('channel not found');
    }

    return RssFeed(
        title: channelElement.getTextFor('title') ?? 'null',
        author: channelElement.getTextFor('author') ?? 'null',
        description: channelElement.getTextFor('description') ?? 'null',
        link: channelElement.getTextFor('link') ?? 'null',
        items: channelElement
            .findElements('item')
            .map<RssItem>((element) => RssItem.parse(element))
            .toIList());
  }
}
