import 'package:flutter/material.dart' hide Action;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:podcustard/actions/observe_audio_player_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/utils/redux_bundle.dart';
import 'package:podcustard/widgets/app-init/initializing_error_page.dart';
import 'package:podcustard/widgets/app-init/initializing_indicator.dart';
import 'package:podcustard/widgets/main_page.dart';
import 'package:redfire/auth/actions/observe_auth_state_action.dart';
import 'package:redfire/auth/models/auth_user_data.dart';
import 'package:redfire/auth/widgets/auth_page.dart';
import 'package:redfire/plugins/wrappers/firebase_wrapper.dart';
import 'package:redfire/settings/enums/brightness_mode_enum.dart';
import 'package:redfire/settings/extensions/brightness_mode_enum_extensions.dart';
import 'package:redux/redux.dart';

class AppWidget extends StatefulWidget {
  final FirebaseWrapper _firebase;
  final ReduxBundle? _redux;

  AppWidget({FirebaseWrapper? firebase, ReduxBundle? redux})
      : _firebase = firebase ?? FirebaseWrapper(),
        _redux = redux;

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late ReduxBundle _redux;
  late Store<AppState> _store;
  dynamic _error;
  bool _initializedFirebase = false;
  bool _initializedRedux = false;

  @override
  void initState() {
    super.initState();
    initializeFlutterFire();
  }

  void initializeFlutterFire() async {
    try {
      // firebase must be initialised first so createStore() can run
      await widget._firebase.init();
      setState(() {
        _initializedFirebase = true;
      });

      // use the injected redux bundle if there is one or create one
      _redux = widget._redux ?? ReduxBundle();
      // create the redux store and run any extra operations
      _store = await _redux.createStore();
      setState(() {
        _initializedRedux = true;
      });

      _store.dispatch(ObserveAuthStateAction());
      _store.dispatch(ObserveAudioPlayerAction());
    } catch (e) {
      setState(() {
        _error = e;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return InitializingErrorPage(_error, StackTrace.current);
    }

    // Show a loader until FlutterFire is initialized
    if (!_initializedFirebase || !_initializedRedux) {
      return InitializingIndicator(
        firebaseDone: _initializedFirebase,
        reduxDone: _initializedRedux,
      );
    }

    return StoreProvider<AppState>(
      store: _store,
      child: StoreConnector<AppState, BrightnessModeEnum>(
          distinct: true,
          converter: (store) => store.state.settings.brightnessMode,
          builder: (context, brightnessMode) {
            return MaterialApp(
              theme: ThemeData(),
              darkTheme: ThemeData.dark(),
              themeMode: brightnessMode.toThemeMode(),
              home: StoreConnector<AppState, AuthUserData?>(
                distinct: true,
                converter: (store) => store.state.authUserData,
                builder: (context, user) {
                  return (user == null) ? AuthPage() : MainPage();
                },
              ),
            );
          }),
    );
  }
}
