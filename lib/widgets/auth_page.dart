import 'package:flutter/material.dart' hide Action;
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:podcustard/models/actions.dart';
import 'package:podcustard/models/app_state.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool supportsAppleSignIn = true;

  @override
  void initState() {
    // // this bool will be true if apple sign in is enabled
    // if (Platform.isIOS) {
    //   var iosInfo = await DeviceInfoPlugin().iosInfo;
    //   var version = iosInfo.systemVersion;

    //   if (version.contains('13') == true) {
    //     supportsAppleSignIn = true;
    //   }
    // }
    super.initState();
  }

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
                              .dispatch(Action.SigninWithApple())),
                    SizedBox(height: 50),
                    GoogleSignInButton(
                      onPressed: () => StoreProvider.of<AppState>(context)
                          .dispatch(Action.SigninWithGoogle()),
                      darkMode: true, // default: false
                    )
                  ],
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text('Calling Auth Provider...')
                    ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text('Calling Firebase...')
                    ]),
              ],
            ),
          );
        });
  }
}
