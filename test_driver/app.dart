import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:redux/redux.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';
import 'package:podcustard/redux/app_reducer.dart';
import 'package:podcustard/redux/app_state.dart';
import 'package:podcustard/redux/middleware.dart';
import 'package:podcustard/services/auth_service.dart';
import 'package:podcustard/utilities/mocks.dart';
import 'package:podcustard/widgets/app.dart';

import '../test/mocks/mock_firebase_auth.dart';

void main() async {
  enableFlutterDriverExtension();

  final RemoteDevToolsMiddleware remoteDevtools =
      RemoteDevToolsMiddleware(imac_ip21);

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.init(),
    middleware: [
      remoteDevtools,
      ...createMiddleware(
        AuthService(Mocks.fakeFirebaseAuth1()),
      ),
    ],
  );

  remoteDevtools.store = store;

  await remoteDevtools.connect();

  runApp(RideCompareApp(store));
}