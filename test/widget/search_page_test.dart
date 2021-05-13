import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/actions/store_podcast_summaries_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/podcast_summary.dart';
import 'package:podcustard/reducers/app_reducer.dart';
import 'package:podcustard/widgets/podcasts_search/search_page.dart';
import 'package:redux/redux.dart';

import '../test-doubles/image_test_utils.dart';

void main() {
  testWidgets('SearchPage displays the results of a search',
      (WidgetTester tester) async {
    // create a basic store with a reducer that...
    final store = Store<AppState>(appReducer, initialState: AppState());

    final summary1 = PodcastSummary(
        artistName: 'a', collectionName: 'b', artworkUrl100: 'h');
    final summary2 = PodcastSummary(
        artistName: 'c', collectionName: 'd', artworkUrl100: 't');
    final summaries = [summary1, summary2].lock;

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

    store.dispatch(StorePodcastSummariesAction(summaries));

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
