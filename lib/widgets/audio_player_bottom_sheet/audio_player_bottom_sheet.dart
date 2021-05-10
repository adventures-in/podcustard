import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:podcustard/actions/pause_track_action.dart';
import 'package:podcustard/actions/resume_track_action.dart';
import 'package:podcustard/enums/track_state_enum.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/track.dart';

class AudioPlayerBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Track?>(
        distinct: true,
        converter: (store) => store.state.track,
        builder: (context, track) {
          if (track == null) return Container();
          return Container(
              height: 100,
              child: Row(children: <Widget>[
                Image.network(track.imageUrl),
                Expanded(
                    child: Column(
                  children: <Widget>[
                    Text(track.episode),
                    StoreConnector<AppState, Track?>(
                        distinct: true,
                        converter: (store) => store.state.track,
                        builder: (context, state) {
                          return Row(children: <Widget>[
                            if (track.state == TrackStateEnum.playing)
                              IconButton(
                                icon: Icon(Icons.pause_circle_outline),
                                onPressed: () {
                                  StoreProvider.of<AppState>(context)
                                      .dispatch(PauseTrackAction());
                                },
                              )
                            else if (track.state == TrackStateEnum.paused)
                              IconButton(
                                icon: Icon(Icons.play_arrow),
                                onPressed: () {
                                  StoreProvider.of<AppState>(context)
                                      .dispatch(ResumeTrackAction());
                                },
                              )
                            else
                              CircularProgressIndicator(),
                            if (track.position == null ||
                                track.duration == null)
                              Expanded(child: LinearProgressIndicator())
                            else
                              Expanded(
                                  child: LinearProgressIndicator(
                                      value:
                                          track.position! / track.duration!)),
                          ]);
                        }),
                  ],
                ))
              ]));
        });
  }
}
