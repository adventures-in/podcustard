import 'package:podcustard/actions/build_track_from_episode_action.dart';
import 'package:podcustard/actions/store_track_action.dart';
import 'package:podcustard/enums/track_state_enum.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/track.dart';
import 'package:podcustard/utils/locator.dart';
import 'package:redux/redux.dart';

class BuildTrackFromEpisodeMiddleware
    extends TypedMiddleware<AppState, BuildTrackFromEpisodeAction> {
  BuildTrackFromEpisodeMiddleware()
      : super((store, action, next) async {
          next(action);

          final audioPlayerService = Locator.getAudioPlayerService();

          final track = Track(
              episode: action.episodeTitle,
              author: store.state.detailVM?.summary.artistName ?? '',
              audioUrl: action.audioUrl,
              imageUrl: store.state.detailVM?.summary.artworkUrl60 ?? '',
              state: TrackStateEnum.nothing);
          store.dispatch(StoreTrackAction(track));

          // load and play the track, the service will emit relevant actions
          // into its stream and the _observeAudioPlayer middleware will dispatch
          // actions as they are emitted
          await audioPlayerService.loadWithUrl(action.audioUrl);
          await audioPlayerService.play();
        });
}
