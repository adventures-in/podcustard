import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:podcustard/actions/observe_audio_player_action.dart';
import 'package:podcustard/middleware/app_middleware.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/plugins/wrappers/audio_player_wrapper.dart';
import 'package:podcustard/reducers/reducers_list.dart';
import 'package:podcustard/services/audio_player_service.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:podcustard/services/itunes_service.dart';
import 'package:podcustard/widgets/main_page.dart';
import 'package:redfire/app-init/widgets/app_widget.dart';
import 'package:redfire/redux/redux_bundle.dart';
import 'package:redfire/redux/store_operation.dart';
import 'package:redux/redux.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';

void main() async {
  // Create the rdt middleware that connects to the rdt server.
  final _rdtMiddleware = RemoteDevToolsMiddleware<AppState>('localhost:8000');

  final middlewares = <Middleware<AppState>>[
    ...appMiddleware(
        audioPlayerService: AudioPlayerService(AudioPlayerWrapper()),
        feedsService: FeedsService(Client()),
        iTunesService: ItunesService(Client())),
    _rdtMiddleware
  ];

  // Create an operation for the redux bundle to run on the store.
  // In this case, we give RemoteDevToolsMiddleware access to the store then
  // tell it to connect to the server.
  final _rdtOperation = StoreOperation<AppState>((store) async {
    _rdtMiddleware.store = store;
    await _rdtMiddleware.connect();
  });

  // Setup the redux bundle to use a different bucket and with an extra
  // middleware that sends each action and state to the rdt server for display.
  ReduxBundle.setup(
      bucketName: 'gs://profile-pics-prototyping',
      storeOperations: [_rdtOperation]);

  runApp(AppWidget(
    initialState: AppState.init(),
    initialActions: [ObserveAudioPlayerAction()],
    middlewares: middlewares,
    reducers: reducers,
    mainPage: MainPage(),
  ));
}
