import 'package:mockito/mockito.dart';
import 'package:podcustard/models/actions/redux_action.dart';
import 'package:podcustard/models/actions/store_feed.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:rss_dart/models/rss_feed.dart';

import '../data/feed_test_data.dart';
import 'http_client_mocks.dart';

class FakeFeedsService extends Fake implements FeedsService {
  final client = FakeHttpClient(response: in_the_dark_feed);

  @override
  Future<ReduxAction> retrieveFeed({String url}) async {
    final uriResponse = await client.get(url);
    final feed = RssFeed.parse(uriResponse.body);
    return StoreFeed((b) => b..feed = feed.toBuilder());
  }
}
