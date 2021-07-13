import 'package:flutter/material.dart' hide Action;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/actions/select_podcast_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/widgets/podcast_detail/podcast_detail_page.dart';
import 'package:redux/redux.dart';

import '../test-data/podcast_summary_data.dart';
import '../test-doubles/services/feeds_service_mocks.dart';

void main() {
  testWidgets('PodcastDetailPage displays expected values',
      (WidgetTester tester) async {
    final summary = await getInTheDarkSummary();
    // create a basic store with expected app state
    final appState = AppState.init().copyWith.detailVM!(summary: summary);
    final store =
        FakedOutStore(appState: appState, feedsService: FakeFeedsService());

    store.dispatch(SelectPodcastAction(summary));

    final artistNameFinder = find.text(summary.artistName!);
    final collectionName = find.text(summary.collectionName!);
    final episodeFinder = find.text('S2 E17: Home');
    final episodeFinder2 = find.text('S2 E14: The Decision');

    /// so we can pump NetworkImages without crashing
    await provideMockedNetworkImages(() async {
      // build our app and trigger a frame
      await tester.pumpWidget(
        // create a StoreProvider to wrap widget
        StoreProvider<AppState>(
          store: store,
          child: MaterialApp(home: Material(child: PodcastDetailPage())),
        ),
      );
    });

    // check that the Text with the expected Strings are in the widget tree
    expect(artistNameFinder, findsOneWidget);
    expect(collectionName, findsOneWidget);
    expect(episodeFinder, findsOneWidget);
    expect(episodeFinder2, findsOneWidget);
  });

  /// for testing navigation methods see https://github.com/flutter/flutter/blob/master/packages/flutter/test/material/will_pop_test.dart
  testWidgets('PodcastDetailPage resets state when popped',
      (WidgetTester tester) async {
    final summary = await getInTheDarkSummary();
    // create a basic store with expected app state
    final appState = AppState.init().copyWith.detailVM!(summary: summary);
    final store = Store<RedFireState>(appReducer, initialState: appState);

    final artistNameFinder = find.text(summary.artistName!);
    final collectionName = find.text(summary.collectionName!);
    // var backButton = find.byTooltip('Back');
    // if (backButton.evaluate().isEmpty) {
    //   backButton = find.byType(CupertinoNavigationBarBackButton);
    // }

    Widget buildFrame() {
      return StoreProvider<RedFireState>(
        store: store,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('Home')),
            body: Builder(
              builder: (BuildContext context) {
                return Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return PodcastDetailPage();
                        },
                      ));
                    },
                    child: const Text('X'),
                  ),
                );
              },
            ),
          ),
        ),
      );
    }

    /// so we can pump NetworkImages without crashing
    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(buildFrame());
      await tester.tap(find.text('X'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      // check that the Text with the expected Strings are in the widget tree
      expect(artistNameFinder, findsOneWidget);
      expect(collectionName, findsOneWidget);
      expect(store.state.detailVM!.summary, summary);

      await tester.pageBack();
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      // check that the Text with the expected Strings are in the widget tree
      expect(artistNameFinder, findsNothing);
      expect(collectionName, findsNothing);
      expect(store.state.detailVM, null);
    });
  });
}
