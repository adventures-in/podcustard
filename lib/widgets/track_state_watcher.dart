import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/track.dart';
import 'package:podcustard/widgets/track_bottom_sheet/track_bottom_sheet.dart';

class TrackStateWatcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TrackStateEnum>(
      distinct: true,
      converter: (store) => store.state.track?.state,
      onWillChange: (previousViewModel, newViewModel) {
        final shown =
            StoreProvider.of<AppState>(context).state.bottomSheetShown;
        if (newViewModel == TrackStateEnum.loading && !shown) {
          Scaffold.of(context).showBottomSheet((context) {
            return TrackBottomSheet();
          });
        }
      },
      builder: (context, state) {
        return Container();
      },
    );
  }
}
