import 'package:flutter/material.dart' hide Action;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:podcustard/actions/signin_with_apple_action.dart';
import 'package:podcustard/actions/signin_with_google_action.dart';
import 'package:podcustard/models/app_state.dart';

import 'auth_page_buttons/apple_sign_in_button.dart';
import 'auth_page_buttons/google_sign_in_button.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool supportsAppleSignIn = true;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
        distinct: true,
        converter: (store) => store.state.authStep,
        builder: (context, authState) {
          return Material(
            child: IndexedStack(
              alignment: Alignment.center,
              index: authState,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (supportsAppleSignIn)
                      AppleSignInButton(
                          style: AppleButtonStyle.black,
                          onPressed: () => StoreProvider.of<AppState>(context)
                              .dispatch(SigninWithAppleAction())),
                    SizedBox(height: 50),
                    GoogleSignInButton(
                      onPressed: () => StoreProvider.of<AppState>(context)
                          .dispatch(SigninWithGoogleAction()),
                      darkMode: true, // default: false
                    )
                  ],
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text('Contacting Auth Provider...')
                    ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text('Signing in with Firebase...')
                    ]),
              ],
            ),
          );
        });
  }
}
