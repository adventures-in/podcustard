import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/podcast_summary.dart';
import 'package:podcustard/redux/app_reducer.dart';
import 'package:podcustard/widgets/podcast_summary_tile.dart';
import 'package:redux/redux.dart';

import '../mocks/image_test_utils.dart';

void main() {
  testWidgets('PodcastSummaryTile displays expected values',
      (WidgetTester tester) async {
    // create a basic store with a reducer that ...
    final store = Store<AppState>(appReducer, initialState: AppState.init());

    final nowTime = DateTime.now();
    final summary = PodcastSummary((b) => b
      ..artistId = 1
      ..collectionId = 2
      ..trackId = 3
      ..trackCount = 4
      ..releaseDate = nowTime
      ..artistName = 'a'
      ..collectionName = 'b'
      ..trackName = 'c'
      ..artistViewUrl = 'd'
      ..collectionViewUrl = 'e'
      ..feedUrl = 'f'
      ..trackViewUrl = 'g'
      ..artworkUrl30 = 'h'
      ..artworkUrl60 = 'i'
      ..artworkUrl100 = 'j'
      ..artworkUrl600 = 'k'
      ..country = 'l'
      ..primaryGenreName = 'm'
      ..genreIds = ListBuilder(<String>['n', 'o'])
      ..genres = ListBuilder(<String>['p', 'q']));

    final subscribeFinder = find.text('SUBSCRIBE');
    final titleFinder = find.text('a');
    final subtitleFinder = find.text('b');

    /// so we can pump NetworkImages without crashing
    await provideMockedNetworkImages(() async {
      // build our app and trigger a frame
      await tester.pumpWidget(
        // create a StoreProvider to wrap widget
        StoreProvider<AppState>(
          store: store,
          child:
              MaterialApp(home: Material(child: PodcastSummaryTile(summary))),
        ),
      );
    });

    // check that the Text with the expected String is in the widget tree
    expect(subscribeFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);
    expect(subtitleFinder, findsOneWidget);
  });
}
