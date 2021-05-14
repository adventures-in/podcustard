import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xml/xml.dart';

part 'rss_enclosure.freezed.dart';
part 'rss_enclosure.g.dart';

@freezed
class RssEnclosure with _$RssEnclosure {
  factory RssEnclosure({
    String? url,
    String? type,
    int? length,
  }) = _RssEnclosure;

  factory RssEnclosure.fromJson(Map<String, Object?> json) =>
      _$RssEnclosureFromJson(json);

  factory RssEnclosure.parse(XmlElement? element) => RssEnclosure(
      length: int.tryParse(element?.getAttribute('length') ?? '0'),
      type: element?.getAttribute('type'),
      url: element?.getAttribute('url'));
}
