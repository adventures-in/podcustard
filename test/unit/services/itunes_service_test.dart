import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/models/actions.dart';
import 'package:podcustard/services/itunes_service.dart';

import '../../mocks/http_client_mocks.dart';
import '../../data/retrieve_podcast_summaries_response.dart';

void main() {
  group('ItunesService', () {
    // has a method that returns a stream that emits user

    test('retrieves a list of podcast summaries', () async {
      final service =
          ItunesService(FakeHttpClient(response: jsonResponseString));

      final action = await service.retrievePodcastSummaries(query: 'query')
          as StorePodcastSummaries;

      expect(action.summaries.length, 50);
    });
  });
}
