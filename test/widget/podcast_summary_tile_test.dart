import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/reducers/app_reducer.dart';
import 'package:podcustard/widgets/podcast_detail/podcast_detail_page.dart';
import 'package:podcustard/widgets/podcasts_search/podcast_summary_tile.dart';
import 'package:redfire/app_state.dart';
import 'package:redux/redux.dart';

import '../test-data/podcast_summary_data.dart';
import '../test-doubles/image_test_utils.dart';

void main() {
  testWidgets('PodcastSummaryTile displays expected values',
      (WidgetTester tester) async {
    // create a basic store with a reducer that ...
    final store =
        Store<RedFireState>(appReducer, initialState: AppState.init());

    final summary = await getInTheDarkSummary();

    final arrowFinder = find.byIcon(Icons.arrow_forward_ios);
    final titleFinder = find.text(summary.collectionName!);
    final subtitleFinder = find.text(summary.artistName!);

    /// so we can pump NetworkImages without crashing
    await provideMockedNetworkImages(() async {
      // build our app and trigger a frame
      await tester.pumpWidget(
        // create a StoreProvider to wrap widget
        StoreProvider<RedFireState>(
          store: store,
          child:
              MaterialApp(home: Material(child: PodcastSummaryTile(summary))),
        ),
      );
    });

    // check that the Text with the expected String is in the widget tree
    expect(arrowFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);
    expect(subtitleFinder, findsOneWidget);
  });

  testWidgets('PodcastSummaryTile dispatches and navigates on selection',
      (WidgetTester tester) async {
    // create a basic store with a reducer that ...
    final store =
        Store<RedFireState>(appReducer, initialState: AppState.init());

    final tileFinder = find.byType(ListTile);
    final detailFinder = find.byType(PodcastDetailPage);

    final summary = await getInTheDarkSummary();

    /// so we can pump NetworkImages without crashing
    await provideMockedNetworkImages(() async {
      // build our app and trigger a frame
      await tester.pumpWidget(
        // create a StoreProvider to wrap widget
        StoreProvider<RedFireState>(
          store: store,
          child:
              MaterialApp(home: Material(child: PodcastSummaryTile(summary))),
        ),
      );
    });

    expect(store.state.detailVM, null);
    expect(detailFinder, findsNothing);

    await tester.tap(tileFinder);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(store.state.detailVM!.summary, summary);
    expect(detailFinder, findsOneWidget);
  });
}
