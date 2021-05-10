import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:podcustard/middleware/middleware_middleware.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/reducers/app_reducer.dart';
import 'package:podcustard/services/audio_player_service.dart';
import 'package:podcustard/services/auth_service.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:podcustard/services/itunes_service.dart';
import 'package:podcustard/utils/apple_signin_object.dart';
import 'package:podcustard/utils/audio_player_object.dart';
import 'package:podcustard/widgets/app_widget.dart';
import 'package:redux/redux.dart';

void main() async {
  final httpClient = http.Client();
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: [
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

  runApp(PodcustardApp(store));
}
