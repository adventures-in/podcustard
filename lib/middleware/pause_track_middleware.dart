import 'package:podcustard/actions/pause_track_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/services/audio_player_service.dart';
import 'package:redux/redux.dart';

class PauseTrackMiddleware extends TypedMiddleware<AppState, PauseTrackAction> {
  PauseTrackMiddleware(AudioPlayerService audioPlayerService)
      : super((store, action, next) async {
          next(action);

          await audioPlayerService.pause();
        });
}
