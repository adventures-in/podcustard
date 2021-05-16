import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/reducers/app_reducer.dart';
import 'package:podcustard/widgets/more_options/dark_mode_toggle.dart';
import 'package:redfire/settings/enums/brightness_mode_enum.dart';
import 'package:redux/redux.dart';

void main() {
  testWidgets('DarkModeToggle dispatches action on toggle',
      (WidgetTester tester) async {
    // create a basic store with a reducer that ...
    final store = Store<AppState>(appReducer,
        middleware: [], initialState: AppState.init());

    // build our app and trigger a frame
    await tester.pumpWidget(
      // create a StoreProvider to wrap widget
      StoreProvider<AppState>(
        store: store,
        child: MaterialApp(home: Material(child: DarkModeToggle())),
      ),
    );

    // tap the middle toggle button and check state changed
    await tester.tap(find.byType(RawMaterialButton).at(1));
    await tester.pump();
    expect(store.state.settings.brightnessMode, BrightnessModeEnum.light);

    // tap the last toggle button and check state changed
    await tester.tap(find.byType(RawMaterialButton).at(2));
    await tester.pump();
    expect(store.state.settings.brightnessMode, BrightnessModeEnum.dark);
  });
}
