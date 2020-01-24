import 'package:podcustard/models/actions.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:test/test.dart';

import '../../mocks/http_client_mocks.dart';
import '../../test_data/twit_feed.dart';

void main() {
  group('FeedsService', () {
    test('retrieves a list of podcast summaries', () async {
      // pass a fake client that returns a saved xml string
      final service = FeedsService(FakeHttpClient(response: twit_feed_xml));

      final url = 'http://feeds.twit.tv/twit.xml';
      final action = await service.retrieveFeed(url: url) as StoreFeed;

      expect(action.feed.title, 'This Week in Tech (MP3)');
      expect(action.feed.items.length, 10);
    });
  });
}
