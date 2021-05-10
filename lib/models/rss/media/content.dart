import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xml/xml.dart';

part 'content.freezed.dart';
part 'content.g.dart';

@freezed
class Content with _$Content {
  factory Content({
    String? url,
    String? type,
    int? fileSize,
    String? medium,
    bool? isDefault,
    String? expression,
    int? bitrate,
    double? framerate,
    double? samplingrate,
    int? channels,
    int? duration,
    int? height,
    int? width,
    String? lang,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  factory Content.parse(XmlElement element) => Content(
      url: element.getAttribute('url'),
      type: element.getAttribute('type'),
      fileSize: int.tryParse(element.getAttribute('fileSize') ?? '0'),
      medium: element.getAttribute('medium'),
      isDefault: element.getAttribute('isDefault') == 'true',
      expression: element.getAttribute('expression'),
      bitrate: int.tryParse(element.getAttribute('bitrate') ?? '0'),
      framerate: double.tryParse(element.getAttribute('framerate') ?? '0'),
      samplingrate:
          double.tryParse(element.getAttribute('samplingrate') ?? '0'),
      channels: int.tryParse(element.getAttribute('channels') ?? '0'),
      duration: int.tryParse(element.getAttribute('duration') ?? '0'),
      height: int.tryParse(element.getAttribute('height') ?? '0'),
      width: int.tryParse(element.getAttribute('width') ?? '0'),
      lang: element.getAttribute('lang'));
}
