import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/redux/app_reducer.dart';
import 'package:podcustard/redux/middleware.dart';
import 'package:podcustard/services/audio_player_service.dart';
import 'package:podcustard/services/auth_service.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:podcustard/services/itunes_service.dart';
import 'package:podcustard/utils/apple_signin_object.dart';
import 'package:podcustard/utils/audio_player_object.dart';
import 'package:podcustard/utils/mocks.dart';
import 'package:podcustard/app/app.dart';
import 'package:redux/redux.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';

void main() async {
  final remoteDevtools = RemoteDevToolsMiddleware(imac18);

  final httpClient = http.Client();

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.init(),
    middleware: [
      remoteDevtools,
      ...createMiddleware(
          authService: AuthService(
            FirebaseAuth.instance,
            GoogleSignIn(scopes: <String>['email']),
            AppleSignInObject(),
          ),
          itunesService: ItunesService(httpClient),
          feedsService: FeedsService(httpClient),
          audioPlayerService: AudioPlayerService(AudioPlayerObject())),
    ],
  );

  remoteDevtools.store = store;

  try {
    await remoteDevtools.connect();
  } on SocketException catch (e) {
    print(e);
  }

  runApp(PodcustardApp(store));
}
