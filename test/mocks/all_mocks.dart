import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../test_data/retrieve_podcast_summaries_response.dart';
import 'mock_firebase_auth.dart';
import 'mock_google_signin.dart';
import 'mock_http_client.dart';

class Mocks {
  static FakeFirebaseAuth1 fakeFirebaseAuth1() => FakeFirebaseAuth1();
  static FakeFirebaseAuthOpen fakeFirebaseAuthOpen() => FakeFirebaseAuthOpen();
  static FakeGoogleSignInCancels fakeGoogleSignInCancels() =>
      FakeGoogleSignInCancels();
  static FakeGoogleSignInThrows fakeGoogleSignInThrows() =>
      FakeGoogleSignInThrows();
  static FakeGoogleSignIn fakeGoogleSignIn() => FakeGoogleSignIn();
  static FakeHttpClient fakeHttpClient(String response) =>
      FakeHttpClient(response: response);

  static MockHttpClient mockHttpClient(String response) {
    final mock = MockHttpClient();
    when(mock.get(any)).thenAnswer((_) => Future.value(http.Response(
        jsonResponseString, 200,
        headers: {'content-type': 'application/json; charset=utf-8'})));
    return mock;
  }
}
