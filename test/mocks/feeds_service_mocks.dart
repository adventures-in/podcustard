import 'package:mockito/mockito.dart';
import 'package:podcustard/models/actions.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:rss_dart/models/rss_feed.dart';

import '../data/feed_test_data.dart';
import 'http_client_mocks.dart';

class FakeFeedsService extends Fake implements FeedsService {
  final client = FakeHttpClient(response: in_the_dark_feed);

  @override
  Future<Action> retrieveFeed({String url}) async {
    final uriResponse = await client.get(url);
    final feed = RssFeed.parse(uriResponse.body);
    return Action.StoreFeed(feed: feed);
  }
}
