import 'dart:async';

import 'package:podcustard/models/app_state.dart';
import 'package:redfire/app_state.dart';
import 'package:redfire/utils/redux/redux_bundle.dart';
import 'package:redux/src/store.dart';

/// The purpose of this class is to take a [Completer] that completes with
/// a fake [Store] with the desired properties.
class FakeReduxBundleCompletable implements ReduxBundle {
  final Completer<Store<AppState>> _reduxCompleter;

  FakeReduxBundleCompletable({required Completer<Store<AppState>> completer})
      : _reduxCompleter = completer {
    ;
  }

  @override
  Future<Store<RedFireState>> createStore() => _reduxCompleter.future;
}
