import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/extensions/extensions.dart';
import 'package:podcustard/models/rss/media/media.dart';
import 'package:podcustard/models/rss/rss_enclosure.dart';
import 'package:xml/xml.dart';

part 'rss_item.freezed.dart';
part 'rss_item.g.dart';

@freezed
class RssItem with _$RssItem {
  factory RssItem({
    String? title,
    String? description,
    String? link,
    Media? media,
    RssEnclosure? enclosure,
  }) = _RssItem;

  factory RssItem.fromJson(Map<String, Object?> json) =>
      _$RssItemFromJson(json);

  factory RssItem.parse(XmlElement element) => RssItem(
        title: element.getTextFor('title'),
        description: element.getTextFor('description'),
        link: element.getTextFor('link'),
        media: Media.parse(element),
        enclosure: RssEnclosure.parse(element.getElementFor('enclosure')),
      );
}

// library rss_item;

// import 'dart:convert';

// import 'package:built_value/built_value.dart';
// import 'package:built_value/serializer.dart';
// import 'package:rss_dart/models/media/media.dart';
// import 'package:rss_dart/models/rss_enclosure.dart';
// import 'package:rss_dart/models/serializers.dart';
// import 'package:xml/xml.dart';
// import 'package:rss_dart/utils/extensions.dart';

// part 'rss_item.g.dart';

// abstract class RssItem implements Built<RssItem, RssItemBuilder> {
//   @nullable
//   String get title;
//   @nullable
//   String get description;
//   @nullable
//   String get link;

//   // List<RssCategory> get categories;
//   // String get guid;
//   // String get pubDate;
//   // String get author;
//   // String get comments;
//   // RssSource get source;
//   // RssContent get content;
//   @nullable
//   Media get media;
//   @nullable
//   RssEnclosure get enclosure;
//   // DublinCore get dc;
//   // RssItemItunes get itunes;

//   RssItem._();

//   factory RssItem([void Function(RssItemBuilder) updates]) = _$RssItem;

//   factory RssItem.parse(XmlElement element) {
//     final builder = RssItemBuilder()
//       ..title = element.getTextFor('title')
//       ..description = element.getTextFor('description')
//       ..link = element.getTextFor('link')
//       ..media = Media.parse(element).toBuilder()
//       ..enclosure =
//           RssEnclosure.parse(element.getElementFor('enclosure')).toBuilder();

//     return builder.build();
//   }

//   // return RssItem(

//   // categories: element.findElements("category").map((element) {
//   //   return RssCategory.parse(element);
//   // }).toList(),
//   // guid: findElementOrNull(element, "guid")?.text,
//   // pubDate: findElementOrNull(element, "pubDate")?.text,
//   // author: findElementOrNull(element, "author")?.text,
//   // comments: findElementOrNull(element, "comments")?.text,
//   // source: RssSource.parse(findElementOrNull(element, "source")),
//   // content: RssContent.parse(findElementOrNull(element, "content:encoded")),
//   // dc: DublinCore.parse(element),
//   // itunes: RssItemItunes.parse(element),
//   // );
//   // }

//   Object toJson() => serializers.serializeWith(RssItem.serializer, this);

//   static RssItem fromJson(String jsonString) =>
//       serializers.deserializeWith(RssItem.serializer, json.decode(jsonString));

//   static Serializer<RssItem> get serializer => _$rssItemSerializer;
// }
