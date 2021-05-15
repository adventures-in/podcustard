import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:podcustard/models/auth/apple_id_credential.dart';
import 'package:podcustard/models/auth/google_sign_in_credential.dart';
import 'package:podcustard/models/provider_info.dart';
import 'package:podcustard/models/user.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:xml/xml.dart';

extension IterableExtension<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;

  T? firstWhereOrNull(bool Function(T element) test) {
    final list = where(test);
    return list.isEmpty ? null : list.first;
  }
}

extension XmlDocumentExtension on XmlDocument {
  String? getTextFor(String name) => findElements(name).firstOrNull?.text;
}

extension XmlElementExtension on XmlElement {
  String? getTextFor(String name) => findElements(name).firstOrNull?.text;

  XmlElement? getElementFor(String name) => findElements(name).firstOrNull;
}

extension UserExtension on auth.User {
  User toModel() => User(
      uid: uid,
      displayName: displayName ?? 'No name',
      email: email ?? 'noemail',
      photoUrl: photoURL ?? 'default',
      providers: providerData
          .map(
            (provider) => ProviderInfo(
                displayName: provider.displayName,
                email: provider.email,
                phoneNumber: provider.phoneNumber,
                photoUrl: provider.photoURL,
                providerId: provider.providerId,
                uid: provider.uid),
          )
          .toIList());
}

extension GoogleSignInAuthenticationExt on GoogleSignInAuthentication {
  GoogleSignInCredential toModel() => GoogleSignInCredential(
      idToken: idToken,
      accessToken: accessToken,
      serverAuthCode: serverAuthCode);
}

extension AuthorizationCredentialAppleIDExt on AuthorizationCredentialAppleID {
  AppleIdCredential toModel() => AppleIdCredential(
      userIdentifier: userIdentifier,
      givenName: givenName,
      familyName: familyName,
      email: email,
      authorizationCode: authorizationCode,
      identityToken: identityToken,
      state: state);
}
