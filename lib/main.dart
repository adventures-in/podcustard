import 'package:flutter/material.dart';
import 'package:podcustard/actions/observe_audio_player_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/widgets/main_page.dart';
import 'package:redfire/auth/actions/observe_auth_state_action.dart';
import 'package:redfire/auth/widgets/app-init/app_widget.dart';

void main() => runApp(AppWidget<AppState>(
      initialState: AppState.init(),
      initialActions: [ObserveAuthStateAction(), ObserveAudioPlayerAction()],
      mainPage: MainPage(),
    ));
