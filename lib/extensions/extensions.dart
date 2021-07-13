import 'package:redfire/types.dart';
import 'package:xml/xml.dart';

extension IterableExtension<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;

  T? firstWhereOrNull(bool Function(T element) test) {
    final list = where(test);
    return list.isEmpty ? null : list.first;
  }
}

extension AuthenticationEnumExtension on AuthenticationEnum {
  int get value {
    switch (this) {
      case AuthenticationEnum.waitingForInput:
        return 0;
      case AuthenticationEnum.contactingGoogle:
        return 1;
      case AuthenticationEnum.contactingApple:
        return 2;
      case AuthenticationEnum.checking:
        return 3;
      case AuthenticationEnum.signingInWithFirebase:
        return 4;
      case AuthenticationEnum.signingOut:
        return 5;
      default:
        return -1;
    }
  }
}

extension XmlDocumentExtension on XmlDocument {
  String? getTextFor(String name) => findElements(name).firstOrNull?.text;
}

extension XmlElementExtension on XmlElement {
  String? getTextFor(String name) => findElements(name).firstOrNull?.text;

  XmlElement? getElementFor(String name) => findElements(name).firstOrNull;
}
