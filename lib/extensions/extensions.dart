import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:podcustard/actions/add_problem_action.dart';
import 'package:podcustard/enums/auth_step_enum.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/auth/apple_id_credential.dart';
import 'package:podcustard/models/auth/auth_provider_data.dart';
import 'package:podcustard/models/auth/auth_user_data.dart';
import 'package:podcustard/models/auth/google_sign_in_credential.dart';
import 'package:podcustard/models/problem.dart';
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
      AddProblemAction(Problem(error.toString(), trace: trace.toString())));
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
