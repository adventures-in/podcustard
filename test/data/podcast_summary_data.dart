import 'package:built_collection/built_collection.dart';
import 'package:podcustard/models/actions.dart';
import 'package:podcustard/models/podcast_summary.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:rss_dart/models/rss_feed.dart';

import '../mocks/http_client_mocks.dart';
import 'feed_test_data.dart';

final podcastSummaryBasic = PodcastSummary((b) => b
  ..artistId = 1
  ..collectionId = 2
  ..trackId = 3
  ..trackCount = 4
  ..releaseDate = DateTime.fromMicrosecondsSinceEpoch(0)
  ..artistName = 'a'
  ..collectionName = 'b'
  ..trackName = 'c'
  ..artistViewUrl = 'd'
  ..collectionViewUrl = 'e'
  ..feedUrl = 'f'
  ..trackViewUrl = 'g'
  ..artworkUrl30 = 'h'
  ..artworkUrl60 = 'i'
  ..artworkUrl100 = 'j'
  ..artworkUrl600 = 'k'
  ..country = 'l'
  ..primaryGenreName = 'm'
  ..genreIds = ListBuilder(<String>['n', 'o'])
  ..genres = ListBuilder(<String>['p', 'q']));

/// Use the feeds service with a fake http client that returns previously saved
/// response data for the after dark podcast
Future<RssFeed> getAfterDarkFeed() async {
  final service = FeedsService(FakeHttpClient(response: after_dark_feed));
  final action = await service.retrieveFeed(url: 'url') as StoreFeed;
  return action.feed;
}
