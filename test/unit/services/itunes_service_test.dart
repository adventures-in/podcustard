import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/actions/store_podcast_summaries_action.dart';
import 'package:podcustard/services/itunes_service.dart';

import '../../data/podcast_summary_data.dart';
import '../../mocks/http_client_mocks.dart';

void main() {
  group('ItunesService', () {
    // has a method that returns a stream that emits user

    test('retrieves a list of podcast summaries', () async {
      final service = ItunesService(
          FakeHttpClient(response: summaries_json_response_string));

      final action = await service.retrievePodcastSummaries('query')
          as StorePodcastSummariesAction;

      expect(action.summaries.length, 50);
    });
  });
}
