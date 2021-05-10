import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';

// When the user cancels during the signin process, the Future returned
// by signIn completes with null
class FakeGoogleSignInCancels extends Fake implements GoogleSignIn {
  @override
  Future<GoogleSignInAccount> signIn() {
    return Future.value(null);
  }
}

class FakeGoogleSignIn extends Fake implements GoogleSignIn {
  @override
  Future<GoogleSignInAccount> signIn() {
    return Future.value(FakeGoogleSignInAccount());
  }
}

class FakeGoogleSignInThrows extends Fake implements GoogleSignIn {
  @override
  Future<GoogleSignInAccount> signIn() {
    throw Exception('GoogleSignIn.signIn');
  }
}

class FakeGoogleSignInAccount extends Fake implements GoogleSignInAccount {
  @override
  final String displayName = 'name';

  @override
  final String email = 'email';

  @override
  final String id = 'id';

  @override
  final String photoUrl = 'url';

  @override
  Future<GoogleSignInAuthentication> get authentication =>
      Future.value(FakeGoogleSignInAuthentication());

  @override
  bool operator ==(o) =>
      o is GoogleSignInAccount &&
      displayName == o.displayName &&
      email == o.email &&
      id == o.id &&
      photoUrl == o.photoUrl;
}

class FakeGoogleSignInAuthentication extends Fake
    implements GoogleSignInAuthentication {
  /// An OpenID Connect ID token that identifies the user.
  @override
  String get idToken => 'idToken';

  /// The OAuth2 access token to access Google services.
  @override
  String get accessToken => 'accessToken';
}
