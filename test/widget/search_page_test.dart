import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/models/actions.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/podcast_summary.dart';
import 'package:podcustard/redux/app_reducer.dart';
import 'package:podcustard/widgets/podcasts_search/search_page.dart';
import 'package:redux/redux.dart';

import '../mocks/image_test_utils.dart';

void main() {
  testWidgets('SearchPage displays the results of a search',
      (WidgetTester tester) async {
    // create a basic store with a reducer that...
    final store = Store<AppState>(appReducer, initialState: AppState.init());

    final summary1 = PodcastSummary((b) => b
      ..artistName = 'a'
      ..collectionName = 'b'
      ..artworkUrl100 = 'h');
    final summary2 = PodcastSummary((b) => b
      ..artistName = 'c'
      ..collectionName = 'd'
      ..artworkUrl100 = 't');
    final summaries = [summary1, summary2];

    final titleFinder1 = find.text('a');
    final subtitleFinder1 = find.text('c');
    final titleFinder2 = find.text('b');
    final subtitleFinder2 = find.text('d');

    /// so we can pump NetworkImages without crashing
    await provideMockedNetworkImages(() async {
      // build our app and trigger a frame
      await tester.pumpWidget(
        // create a StoreProvider to wrap widget
        StoreProvider<AppState>(
          store: store,
          child: MaterialApp(home: Material(child: SearchPage())),
        ),
      );
    });

    store.dispatch(StorePodcastSummaries(summaries: summaries));

    await provideMockedNetworkImages(() async {
      await tester.pump();
    });

    // check that the Text with the expected String is in the widget tree
    expect(titleFinder1, findsOneWidget);
    expect(subtitleFinder1, findsOneWidget);
    expect(titleFinder2, findsOneWidget);
    expect(subtitleFinder2, findsOneWidget);
  });
}
