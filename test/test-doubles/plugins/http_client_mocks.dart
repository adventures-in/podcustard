import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../exceptions.dart';

class MockHttpClient extends Mock implements http.Client {}

class FakeHttpClient extends Fake implements http.Client {
  FakeHttpClient({required this.response});
  final String response;
  @override
  Future<http.Response> get(url, {Map<String, String>? headers}) {
    return Future.value(http.Response(response, 400,
        headers: {'content-type': 'application/json; charset=utf-8'}));
  }

  @override
  void close() {}
}

class FakeHttpClientThrows extends Fake implements http.Client {
  @override
  Future<http.Response> get(url, {Map<String, String>? headers}) {
    throw (TestException(
        'thrown when `get` was called on a FakeHttpClientThrows object'));
  }

  @override
  void close() {}
}

// MockHttpClient getMockHttpClient(String response) {
//   final mock = MockHttpClient();
//   when(mock.get(any)).thenAnswer((_) => Future.value(http.Response(
//       response, 200,
//       headers: {'content-type': 'application/json; charset=utf-8'})));
//   return mock;
// }
