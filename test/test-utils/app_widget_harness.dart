import 'package:flutter/material.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/services/wrappers/firebase_wrapper.dart';
import 'package:podcustard/utils/redux_bundle.dart';
import 'package:podcustard/widgets/app-init/app_widget.dart';
import 'package:redux/redux.dart';

import '../test-doubles/redux/fake_redux_bundle.dart';
import '../test-doubles/wrappers/fake_firebase_wrapper.dart';

/// A test harness to wrap the widget under test, (in this case the
/// AppWidget), and provide all the functionality
/// that a test may want in order to interact with the widget.
///
/// In this case, the firebase and redux futures that are awaited in the
/// AppWidget have already been completed.
class AppWidgetHarness {
  final FirebaseWrapper _firebase;
  final ReduxBundle _redux;
  late final AppWidget _appWidget;

  // The fake redux bundle just provides the given store to the AppWidget,
  // when the AppWidget calls _redux.createStore()
  AppWidgetHarness({required Store<AppState> store})
      : _firebase = FakeFirebaseWrapper(),
        _redux = FakeReduxBundle(store: store) {
    _appWidget = AppWidget(firebase: _firebase, redux: _redux);
  }

  Widget get widget => _appWidget;
}
