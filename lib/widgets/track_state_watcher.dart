import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/track.dart';
import 'package:podcustard/widgets/audio_player_bottom_sheet/audio_player_bottom_sheet.dart';

class TrackStateWatcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TrackStateEnum>(
      distinct: true,
      converter: (store) => store.state.track?.state,
      onWillChange: (previousViewModel, newViewModel) {
        // we want to kow if the bottom sheet is already shown
        final shown =
            StoreProvider.of<AppState>(context).state.bottomSheetShown;

        // if the track state has changed to loading and the bottom sheet is not
        // already shown then show it
        if (newViewModel == TrackStateEnum.loading && !shown) {
          Scaffold.of(context).showBottomSheet((context) {
            return AudioPlayerBottomSheet();
          });
        }
      },
      builder: (context, state) {
        // the widget is just for monitering the state and showing the bottom sheet
        return Container();
      },
    );
  }
}
