// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/reducers/app_reducer.dart';
import 'package:podcustard/widgets/main_page.dart';
import 'package:redfire/app_state.dart';
import 'package:redux/redux.dart';

void main() {
  testWidgets('MainPage displays...', (WidgetTester tester) async {
    final store =
        Store<RedFireState>(appReducer, initialState: AppState.init());

    final moreOptionsFinder = find.text('More');

    // build the widget and trigger a frame
    await tester.pumpWidget(
      // create a StoreProvider to wrap widget
      StoreProvider<RedFireState>(
        store: store,
        child: MaterialApp(home: MainPage()),
      ),
    );

    // check that the More Options items is in the widget tree
    expect(moreOptionsFinder, findsOneWidget);
  });

  testWidgets('MainPage navigates to BottomNav options',
      (WidgetTester tester) async {
    final store =
        Store<RedFireState>(appReducer, initialState: AppState.init());

    final moreOptionsFinder = find.text('More');
    final signoutFinder = find.text('SIGN OUT');

    // build the widget and trigger a frame
    await tester.pumpWidget(
      // make store available by wrapping in a StoreProvider
      StoreProvider<RedFireState>(
        store: store,
        child: MaterialApp(home: MainPage()),
      ),
    );

    // check the More Options item is in the widget tree
    expect(moreOptionsFinder, findsOneWidget);

    // tap More Options and wait for a rebuild
    await tester.tap(moreOptionsFinder);
    await tester.pump();

    // check that MoreOptionsPage is in the widget tree
    expect(signoutFinder, findsOneWidget);
  });
}
