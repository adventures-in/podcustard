import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/redux/app_reducer.dart';
import 'package:podcustard/redux/middleware.dart';
import 'package:podcustard/widgets/track_state_watcher.dart';
import 'package:redux/redux.dart';

void main() {
  testWidgets('SearchText dispatches actions on input',
      (WidgetTester tester) async {
    // create mock services so the Store provides mock data

    // create a basic store with a reducer that ...
    final store = Store<AppState>(appReducer,
        middleware: [...createMiddleware()], initialState: AppState.init());

    // build our app and trigger a frame
    await tester.pumpWidget(
      // create a StoreProvider to wrap widget
      StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
            home: Scaffold(
                appBar: AppBar(
          actions: <Widget>[TrackStateWatcher()],
        ))),
      ),
    );

    store.dispatch(action)
    await tester.enterText(find.byType(SearchText), 'a');

    // check that the search triggered a request to the iTunesService, which
    // gets the test data and converts to a list of Podcast objects, and
    // the list was stored
    expect(store.state.podcastSummaries.length, 50);
  });
}
