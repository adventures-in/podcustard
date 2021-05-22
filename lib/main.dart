import 'package:flutter/material.dart';
import 'package:podcustard/actions/observe_audio_player_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/reducers/reducers_list.dart';
import 'package:podcustard/widgets/main_page.dart';
import 'package:redfire/app-init/widgets/app_widget.dart';
import 'package:redfire/auth/actions/observe_auth_state_action.dart';

void main() => runApp(AppWidget<AppState>(
      initialState: AppState.init(),
      initialActions: [ObserveAuthStateAction(), ObserveAudioPlayerAction()],
      reducers: reducers,
      mainPage: MainPage(),
    ));
