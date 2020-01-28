import 'package:mockito/mockito.dart';
import 'package:podcustard/models/actions.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:rss_dart/models/rss_feed.dart';

import '../test_data/after_dark_rss_feed_xml.dart';
import 'http_client_mocks.dart';

class FakeFeedsService extends Fake implements FeedsService {
  final client = FakeHttpClient(response: after_dark);

  @override
  Future<Action> retrieveFeed({String url}) async {
    final uriResponse = await client.get(url);
    final feed = RssFeed.parse(uriResponse.body);
    return Action.StoreFeed(feed: feed);
  }
}
