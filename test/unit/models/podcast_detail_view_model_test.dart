import 'package:podcustard/models/podcast_detail_view_model.dart';
import 'package:podcustard/models/podcast_summary.dart';
import 'package:test/test.dart';

import '../../data/feed_test_data.dart';
import '../../data/podcast_summary_data.dart';

void main() {
  ///
  /// -- Non-nullable
  ///
  /// PodcastSummary summary (note has only nullable members so can be null)
  ///
  /// -- nullable
  ///
  /// RssFeed feed
  ///

  group('PodcastSummary', () {
    test('deals with null for nullable members', () {
      final vm = PodcastDetailViewModelBuilder().build();

      expect(vm.summary, PodcastSummaryBuilder().build());
      expect(vm.feed, null);
    });

    test('members take expected values', () async {
      final feed = await getInTheDarkFeed();
      final summary = await getInTheDarkSummary();
      final vm = PodcastDetailViewModel((b) => b
        ..summary = summary.toBuilder()
        ..feed = feed.toBuilder());

      expect(vm.summary, summary);
      expect(vm.feed, feed);
    });
  });
}
