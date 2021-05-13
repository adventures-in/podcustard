import 'package:mockito/mockito.dart';
import 'package:podcustard/actions/redux_action.dart';
import 'package:podcustard/actions/store_feed_action.dart';
import 'package:podcustard/models/rss/rss_feed.dart';
import 'package:podcustard/services/feeds_service.dart';

import '../../test-data/feed_test_data.dart';
import '../plugins/http_client_mocks.dart';

class FakeFeedsService extends Fake implements FeedsService {
  final client = FakeHttpClient(response: in_the_dark_feed);

  @override
  Future<ReduxAction> retrieveFeed(String url) async {
    final uriResponse = await client.get(Uri.parse(url));
    final feed = RssFeed.parse(uriResponse.body);
    return StoreFeedAction(feed);
  }
}
