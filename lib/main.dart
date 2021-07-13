import 'package:flutter/material.dart';
import 'package:podcustard/actions/observe_audio_player_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/reducers/reducers_list.dart';
import 'package:podcustard/widgets/main_page.dart';
import 'package:redfire/widgets.dart';

void main() => runApp(AppWidget<AppState>(
      initialState: AppState.init(),
      initialActions: [ObserveAudioPlayerAction()],
      reducers: reducers,
      mainPage: MainPage(),
    ));
