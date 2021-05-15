import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:podcustard/models/auth/auth_user_data.dart';

class UserExamples {
  static AuthUserData get basic => AuthUserData(
      uid: 'uid',
      displayName: 'displayName',
      photoURL: 'photoURL',
      email: 'email',
      emailVerified: false,
      isAnonymous: false,
      providers: IList());
}
