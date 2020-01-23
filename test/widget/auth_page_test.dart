import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/redux/app_reducer.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/redux/middleware.dart';
import 'package:podcustard/services/auth_service.dart';
import 'package:podcustard/widgets/auth_page.dart';
import 'package:redux/redux.dart';

import '../mocks/apple_signin_mocks.dart';
import '../mocks/firebase_auth_mocks.dart';
import '../mocks/google_signin_mocks.dart';

void main() {
  group('AuthPage', () {
    testWidgets('displays sign in button', (WidgetTester tester) async {
      // create a basic store with middleware, services and reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
        middleware: [
          ...createMiddleware(
              AuthService(FakeFirebaseAuth1(), FakeGoogleSignIn(), null), null),
        ],
      );

      final authPageFinder = find.byType(GoogleSignInButton);

      // build our app and trigger a frame
      await tester.pumpWidget(
        // create a StoreProvider to wrap widget
        StoreProvider<AppState>(
          store: store,
          child: MaterialApp(home: AuthPage()),
        ),
      );

      // check that the Text with the expected String is in the widget tree
      expect(authPageFinder, findsOneWidget);
    });

    testWidgets('dispatches SigninWithGoogle on tap',
        (WidgetTester tester) async {
      final signInButtonFinder = find.byType(GoogleSignInButton);

      // create a basic store with middleware, services and reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
        middleware: [
          ...createMiddleware(
              AuthService(FakeFirebaseAuth1(), FakeGoogleSignInCancels(), null),
              null),
        ],
      );

      // build our app and trigger a frame
      await tester.pumpWidget(
        // create a StoreProvider to wrap widget
        StoreProvider<AppState>(
          store: store,
          child: MaterialApp(home: AuthPage()),
        ),
      );

      await tester.tap(signInButtonFinder);

      // the fake google sign in we created returns null, as when the
      // user cancels, so the steps should have been reset to 0
      expect(store.state.authStep, 0);
    });

    testWidgets('dispatches SigninWithApple on tap',
        (WidgetTester tester) async {
      final signInButtonFinder = find.byType(AppleSignInButton);

      // create a basic store with middleware, services and reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
        middleware: [
          ...createMiddleware(
              AuthService(null, null, FakeAppleSignInCancels()), null),
        ],
      );

      // build our app and trigger a frame
      await tester.pumpWidget(
        // create a StoreProvider to wrap widget
        StoreProvider<AppState>(
          store: store,
          child: MaterialApp(home: AuthPage()),
        ),
      );

      await tester.tap(signInButtonFinder);

      // the fake apple sign in we created has cancelled status so the steps
      // should have been reset to 0
      expect(store.state.authStep, 0);
    });
  });
}
