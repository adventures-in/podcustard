import 'package:mockito/mockito.dart';
import 'package:podcustard/actions/store_feed_action.dart';
import 'package:podcustard/models/rss/rss_feed.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:redfire/types.dart';
import 'package:redfire_test/redfire_test.dart';

import '../../test-data/feed_test_data.dart';

class FakeFeedsService extends Fake implements FeedsService {
  final mockClient = Stubbed.client(body: in_the_dark_feed);

  @override
  Future<ReduxAction> retrieveFeed(String url) async {
    final uriResponse = await mockClient.get(Uri.parse(url));
    final feed = RssFeed.parse(uriResponse.body);
    return StoreFeedAction(feed);
  }
}
