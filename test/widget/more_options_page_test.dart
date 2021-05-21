import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/reducers/app_reducer.dart';
import 'package:podcustard/widgets/more_options/more_options_page.dart';
import 'package:redfire/app_state.dart';
import 'package:redux/redux.dart';

void main() {
  testWidgets('MoreOptionsPage displays...', (WidgetTester tester) async {
    // create a basic store with middleware that uses the AuthService to
    // observe auth state and a reducer that saves the emitted auth state
    final store =
        Store<RedFireState>(appReducer, initialState: AppState.init());

    final signoutFinder = find.text('SIGN OUT');

    // build our app and trigger a frame
    await tester.pumpWidget(
      // create a StoreProvider to wrap widget
      StoreProvider<RedFireState>(
        store: store,
        child: MaterialApp(home: Material(child: MoreOptionsPage())),
      ),
    );

    // check that the Text with the expected String is in the widget tree
    expect(signoutFinder, findsOneWidget);
  });
}
