import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/services/itunes_service.dart';
import 'package:podcustard/widgets/podcasts_search/search_text.dart';

import '../test-data/podcast_summary_data.dart';
import '../test-doubles/plugins/http_client_mocks.dart';
import '../test-doubles/redux/faked_out_store.dart';

void main() {
  testWidgets('SearchText dispatches actions on input',
      (WidgetTester tester) async {
    // create mock services so the Store provides mock data
    final fakeClient = FakeHttpClient(response: summaries_json_response_string);
    final fakeService = ItunesService(fakeClient);

    // create a basic store with a reducer that ...
    final fakedOutStore = FakedOutStore(iTunesService: fakeService);

    // build our app and trigger a frame
    await tester.pumpWidget(
      // create a StoreProvider to wrap widget
      StoreProvider<AppState>(
        store: fakedOutStore,
        child: MaterialApp(home: Material(child: SearchText(fakedOutStore))),
      ),
    );

    await tester.enterText(find.byType(SearchText), 'a');

    // check that the search triggered a request to the iTunesService, which
    // gets the test data and converts to a list of Podcast objects, and
    // the list was stored
    expect(fakedOutStore.state.podcastSummaries.length, 50);
  });
}
