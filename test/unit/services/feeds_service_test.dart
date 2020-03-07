import 'package:podcustard/models/actions/store_feed.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:test/test.dart';

import '../../data/feed_test_data.dart';
import '../../mocks/http_client_mocks.dart';

void main() {
  group('FeedsService', () {
    test('retrieves a list of podcast summaries', () async {
      // pass a fake client that returns a saved xml string
      final service = FeedsService(FakeHttpClient(response: twit_feed));

      final url = 'http://feeds.twit.tv/twit.xml';
      final action = await service.retrieveFeed(url: url) as StoreFeed;

      expect(action.feed.title, 'This Week in Tech (MP3)');
      expect(action.feed.items.length, 10);
    });

    test('hello', () async {
      // pass a fake client that returns a saved xml string
      final service = FeedsService(FakeHttpClient(response: in_the_dark_feed));

      final url =
          'https://feeds.publicradio.org/public_feeds/in-the-dark/itunes/rss';
      final action = await service.retrieveFeed(url: url) as StoreFeed;

      expect(action.feed.title, 'In the Dark');
      expect(action.feed.items.length, 35);
      expect(action.feed.items.first.enclosure.length, 17295613);
    });
  });
}

//
