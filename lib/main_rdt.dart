import 'package:flutter/material.dart';
import 'package:podcustard/actions/observe_audio_player_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/widgets/main_page.dart';
import 'package:redfire/auth/actions/observe_auth_state_action.dart';
import 'package:redfire/auth/widgets/app-init/app_widget.dart';
import 'package:redfire/utils/redux/redux_bundle.dart';
import 'package:redfire/utils/store_operation.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';

void main() async {
  // Create the rdt middleware that connects to the rdt server.
  final _rdtMiddleware = RemoteDevToolsMiddleware<dynamic>('localhost:8000');

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

  runApp(AppWidget(
    initialState: AppState.init(),
    initialActions: [ObserveAuthStateAction(), ObserveAudioPlayerAction()],
    mainPage: MainPage(),
  ));
}
