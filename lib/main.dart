import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/redux/app_reducer.dart';
import 'package:podcustard/redux/middleware.dart';
import 'package:podcustard/services/auth_service.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:podcustard/services/itunes_service.dart';
import 'package:podcustard/utils/apple_signin.dart';
import 'package:podcustard/widgets/app.dart';
import 'package:redux/redux.dart';

void main() async {
  final httpClient = http.Client();
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.init(),
    middleware: [
      ...createMiddleware(
          AuthService(
            FirebaseAuth.instance,
            GoogleSignIn(scopes: <String>['email']),
            AppleSignInObject(),
          ),
          ItunesService(httpClient),
          FeedsService(httpClient)),
    ],
  );

  runApp(PodcustardApp(store));
}
