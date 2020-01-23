import 'package:podcustard/models/actions.dart';
import 'package:http/http.dart' as http;
import 'package:podcustard/services/feeds_service.dart';
import 'package:test/test.dart';

import '../../mocks/http_client_mocks.dart';
import '../../test_data/twit_feed.dart';

void main() {
  group('FeedsService', () {
    test('retrieves a list of podcast summaries', () async {
      // create the same tests that are here:
      // https://github.com/witochandra/webfeed/blob/master/test/rss_test.dart
      // and check that the test data there passes

      // pass a fake client that returns a saved xml string
      final service = FeedsService(FakeHttpClient(response: twit_feed_xml));
      // http.Client()

      final url = 'http://feeds.twit.tv/twit.xml';
      final action = await service.retrieveFeed(url: url) as StoreFeed;

      print(action.feed.runtimeType);

      // expect(action.feed.author, 'author');
    });
  });
}
