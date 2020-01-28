import 'package:flutter/material.dart' hide Action;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/models/actions.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/redux/app_reducer.dart';
import 'package:podcustard/redux/middleware.dart';
import 'package:podcustard/widgets/podcast_detail_page.dart';
import 'package:redux/redux.dart';

import '../mocks/feeds_service_mocks.dart';
import '../mocks/image_test_utils.dart';
import '../test_data/podcasts_data.dart';

void main() {
  testWidgets('PodcastDetailPage displays expected values',
      (WidgetTester tester) async {
    // create a basic store with expected app state
    final appState = AppState.init()
        .rebuild((b) => b..detailVM.summary.replace(podcastSummaryBasic));
    final store = Store<AppState>(appReducer,
        initialState: appState,
        middleware: createMiddleware(null, null, FakeFeedsService()));

    store.dispatch(Action.SelectPodcast(podcast: podcastSummaryBasic));

    final artistNameFinder = find.text('a');
    final collectionName = find.text('b');
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
    // create a basic store with expected app state
    final appState = AppState.init()
        .rebuild((b) => b..detailVM.summary.replace(podcastSummaryBasic));
    final store = Store<AppState>(appReducer, initialState: appState);

    final artistNameFinder = find.text('a');
    final collectionName = find.text('b');
    // var backButton = find.byTooltip('Back');
    // if (backButton.evaluate().isEmpty) {
    //   backButton = find.byType(CupertinoNavigationBarBackButton);
    // }

    Widget buildFrame() {
      return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('Home')),
            body: Builder(
              builder: (BuildContext context) {
                return Center(
                  child: FlatButton(
                    child: const Text('X'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return PodcastDetailPage();
                        },
                      ));
                    },
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
      expect(store.state.detailVM.summary, podcastSummaryBasic);

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
