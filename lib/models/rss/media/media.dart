import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/models/rss/media/content.dart';
import 'package:xml/xml.dart';

part 'media.freezed.dart';
part 'media.g.dart';

@freezed
class Media with _$Media {
  factory Media(IList<Content> contents) = _Media;

  factory Media.fromJson(Map<String, Object?> json) => _$MediaFromJson(json);

  factory Media.parse(XmlElement element) => Media(element
      .findElements('media:content')
      .map((e) => Content.parse(e))
      .toIList());
}
