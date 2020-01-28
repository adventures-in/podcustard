import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/redux/app_reducer.dart';
import 'package:podcustard/widgets/podcast_detail_page.dart';
import 'package:podcustard/widgets/podcast_summary_tile.dart';
import 'package:redux/redux.dart';

import '../mocks/image_test_utils.dart';
import '../test_data/podcasts_data.dart';

void main() {
  testWidgets('PodcastSummaryTile displays expected values',
      (WidgetTester tester) async {
    // create a basic store with a reducer that ...
    final store = Store<AppState>(appReducer, initialState: AppState.init());

    final subscribeFinder = find.byIcon(Icons.arrow_forward_ios);
    final titleFinder = find.text('a');
    final subtitleFinder = find.text('b');

    /// so we can pump NetworkImages without crashing
    await provideMockedNetworkImages(() async {
      // build our app and trigger a frame
      await tester.pumpWidget(
        // create a StoreProvider to wrap widget
        StoreProvider<AppState>(
          store: store,
          child: MaterialApp(
              home: Material(child: PodcastSummaryTile(podcastSummaryBasic))),
        ),
      );
    });

    // check that the Text with the expected String is in the widget tree
    expect(subscribeFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);
    expect(subtitleFinder, findsOneWidget);
  });

  testWidgets('PodcastSummaryTile dispatches and navigates on selection',
      (WidgetTester tester) async {
    // create a basic store with a reducer that ...
    final store = Store<AppState>(appReducer, initialState: AppState.init());

    final tileFinder = find.byType(ListTile);
    final detailFinder = find.byType(PodcastDetailPage);

    /// so we can pump NetworkImages without crashing
    await provideMockedNetworkImages(() async {
      // build our app and trigger a frame
      await tester.pumpWidget(
        // create a StoreProvider to wrap widget
        StoreProvider<AppState>(
          store: store,
          child: MaterialApp(
              home: Material(child: PodcastSummaryTile(podcastSummaryBasic))),
        ),
      );
    });

    expect(store.state.detailVM, null);
    expect(detailFinder, findsNothing);

    await tester.tap(tileFinder);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(store.state.detailVM.summary, podcastSummaryBasic);
    expect(detailFinder, findsOneWidget);
  });
}
