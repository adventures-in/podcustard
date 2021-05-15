import 'package:flutter/material.dart' hide Action;
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/utils/redux_bundle.dart';
import 'package:podcustard/utils/store_operation.dart';
import 'package:podcustard/widgets/app-init/app_widget.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';

void main() async {
  // Create the rdt middleware that connects to the rdt server.
  final _rdtMiddleware = RemoteDevToolsMiddleware<AppState>('localhost:8000');

  // Create an operation for the redux bundle to run on the store.
  // In this case, we give RemoteDevToolsMiddleware access to the store then
  // tell it to connect to the server.
  final _rdtOperation = StoreOperation((store) async {
    _rdtMiddleware.store = store;
    await _rdtMiddleware.connect();
  });

  // Setup the redux bundle to use a different bucket and with an extra
  // middleware that sends each action and state to the rdt server for display.
  ReduxBundle.setup(
      bucketName: 'gs://profile-pics-prototyping',
      extraMiddlewares: [_rdtMiddleware],
      storeOperations: [_rdtOperation]);

  runApp(AppWidget());
}
