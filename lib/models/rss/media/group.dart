import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/models/rss/media/content.dart';
import 'package:xml/xml.dart';

part 'group.freezed.dart';
part 'group.g.dart';

@freezed
class Group with _$Group {
  factory Group(IList<Content> contents) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  factory Group.parse(XmlElement element) => Group(element
      .findElements('media:content')
      .map((e) => Content.parse(e))
      .toIList());
}
