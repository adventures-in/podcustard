import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/track.dart';

class TrackBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Track>(
      distinct: true,
      converter: (store) => store.state.track,
      builder: (context, track) {
        return Row(
          children: <Widget>[
            Image.network(track.imageUrl),
            Column(
              children: <Widget>[
                Text(track.episode),
                if (track.position == null || track.duration == null)
                  LinearProgressIndicator()
                else
                  LinearProgressIndicator(
                      value: track.position / track.duration)
              ],
            )
          ],
        );
      },
    );
  }
}
