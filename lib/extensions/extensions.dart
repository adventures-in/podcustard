import 'package:redfire/auth/enums/auth_step_enum.dart';
import 'package:xml/xml.dart';

extension IterableExtension<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;

  T? firstWhereOrNull(bool Function(T element) test) {
    final list = where(test);
    return list.isEmpty ? null : list.first;
  }
}

extension AuthStepEnumExtension on AuthStepEnum {
  int get value {
    switch (this) {
      case AuthStepEnum.waitingForInput:
        return 0;
      case AuthStepEnum.contactingGoogle:
        return 1;
      case AuthStepEnum.contactingApple:
        return 2;
      case AuthStepEnum.checking:
        return 3;
      case AuthStepEnum.signingInWithFirebase:
        return 4;
      case AuthStepEnum.signingOut:
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
