import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/widgets/podcasts_search/search_text.dart';
import 'package:podcustard/widgets/track_state_watcher.dart';

import '../test-doubles/redux/faked_out_store.dart';

void main() {
  testWidgets('SearchText dispatches actions on input',
      (WidgetTester tester) async {
    // create mock services so the Store provides mock data

    // create a basic store with a reducer that ...
    final fakedOutStore = FakedOutStore();

    // build our app and trigger a frame
    await tester.pumpWidget(
      // create a StoreProvider to wrap widget
      StoreProvider<AppState>(
        store: fakedOutStore,
        child: MaterialApp(
            home: Scaffold(
                appBar: AppBar(
          actions: <Widget>[TrackStateWatcher()],
        ))),
      ),
    );

    await tester.enterText(find.byType(SearchText), 'a');

    // check that the search triggered a request to the iTunesService, which
    // gets the test data and converts to a list of Podcast objects, and
    // the list was stored
    expect(fakedOutStore.state.podcastSummaries.length, 50);
  });
}
