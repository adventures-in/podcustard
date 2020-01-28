import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/redux/app_reducer.dart';
import 'package:podcustard/redux/middleware.dart';
import 'package:podcustard/services/itunes_service.dart';
import 'package:podcustard/widgets/search_text.dart';
import 'package:redux/redux.dart';

import '../mocks/http_client_mocks.dart';
import '../test_data/retrieve_podcast_summaries_response.dart' as test_data;

void main() {
  testWidgets('SearchText dispatches actions on input',
      (WidgetTester tester) async {
    // final fakeClient = Mocks.fakeHttpClient(test_data.jsonResponseString);
    final fakeClient = FakeHttpClient(response: test_data.jsonResponseString);
    final fakeService = ItunesService(fakeClient);

    // create a basic store with a reducer that ...
    final store = Store<AppState>(appReducer,
        middleware: [...createMiddleware(null, fakeService, null)],
        initialState: AppState.init());

    // build our app and trigger a frame
    await tester.pumpWidget(
      // create a StoreProvider to wrap widget
      StoreProvider<AppState>(
        store: store,
        child: MaterialApp(home: Material(child: SearchText(store))),
      ),
    );

    await tester.enterText(find.byType(SearchText), 'a');

    // check that the search triggered a request to the iTunesService, which
    // gets the test data and converts to a list of Podcast objects, and
    // the list was stored
    expect(store.state.podcastSummaries.length, 50);
  });
}
