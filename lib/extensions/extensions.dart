import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:redfire/auth/enums/auth_step_enum.dart';
import 'package:redfire/auth/models/apple_id_credential.dart';
import 'package:redfire/auth/models/auth_provider_data.dart';
import 'package:redfire/auth/models/auth_user_data.dart';
import 'package:redfire/auth/models/google_sign_in_credential.dart';
import 'package:redfire/problems/actions/add_problem_action.dart';
import 'package:redfire/problems/models/problem_info.dart';
import 'package:redux/redux.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
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

extension StoreExtension on Store<AppState> {
  dynamic dispatchProblem(dynamic error, StackTrace trace) => dispatch(
      AddProblemAction(ProblemInfo(error.toString(), trace.toString())));
}

extension FirebaseUserExtension on auth.User {
  AuthUserData toModel() => AuthUserData(
      uid: uid,
      displayName: displayName,
      photoURL: photoURL,
      email: email,
      phoneNumber: phoneNumber,
      createdOn: metadata.creationTime?.toUtc(),
      lastSignedInOn: metadata.lastSignInTime?.toUtc(),
      isAnonymous: isAnonymous,
      emailVerified: emailVerified,
      providers: providerData
          .map<AuthProviderData>((userInfo) => userInfo.toModel())
          .toIList());
}

extension UserInfoExtension on auth.UserInfo {
  AuthProviderData toModel() => AuthProviderData(
        providerId: providerId,
        uid: uid,
        displayName: displayName,
        photoURL: photoURL,
        email: email,
        phoneNumber: phoneNumber,
      );
}
