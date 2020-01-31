import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:redux/redux.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';
import 'package:podcustard/redux/app_reducer.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/redux/middleware.dart';
import 'package:podcustard/services/auth_service.dart';
import 'package:podcustard/utils/mocks.dart';
import 'package:podcustard/widgets/app.dart';

import '../test/mocks/firebase_auth_mocks.dart';
import '../test/mocks/google_signin_mocks.dart';

void main() async {
  enableFlutterDriverExtension();

  final remoteDevtools = RemoteDevToolsMiddleware(imac18);

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.init(),
    middleware: [
      remoteDevtools,
      ...createMiddleware(
          authService:
              AuthService(FakeFirebaseAuth1(), FakeGoogleSignIn(), null)),
    ],
  );

  remoteDevtools.store = store;

  await remoteDevtools.connect();

  runApp(PodcustardApp(store));
}
