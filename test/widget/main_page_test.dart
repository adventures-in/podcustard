// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:podcustard/redux/app_reducer.dart';

import 'package:podcustard/redux/app_state.dart';
import 'package:podcustard/redux/middleware.dart';
import 'package:podcustard/services/auth_service.dart';
import 'package:podcustard/widgets/main_page.dart';

import '../mocks/all_mocks.dart';

void main() {
  testWidgets('MainPage displays...', (WidgetTester tester) async {
    // create a basic store with middleware that uses the AuthService to
    // observe auth state and a reducer that saves the emitted auth state
    final store = Store<AppState>(
      appReducer,
      initialState: AppState.init(),
      middleware: [
        ...createMiddleware(
          AuthService(Mocks.fakeFirebaseAuth1(), Mocks.fakeGoogleSignIn()),
        ),
      ],
    );

    final mainPageFinder = find.text('Main Page');

    // build our app and trigger a frame
    await tester.pumpWidget(
      // create a StoreProvider to wrap widget
      StoreProvider<AppState>(
        store: store,
        child: MaterialApp(home: MainPage()),
      ),
    );

    // check that the Text with the expected String is in the widget tree
    expect(mainPageFinder, findsOneWidget);
  });
}
