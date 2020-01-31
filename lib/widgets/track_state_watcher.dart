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
      builder: (context, state) {
        if (state == TrackStateEnum.loading) {
          Scaffold.of(context).showBottomSheet((context) {
            return TrackBottomSheet();
          });
        }
        return Container();
      },
    );
  }
}
