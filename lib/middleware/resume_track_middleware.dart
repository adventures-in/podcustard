import 'package:podcustard/actions/resume_track_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/services/audio_player_service.dart';
import 'package:redux/redux.dart';

class ResumeTrackMiddleware
    extends TypedMiddleware<AppState, ResumeTrackAction> {
  ResumeTrackMiddleware(AudioPlayerService audioPlayerService)
      : super((store, action, next) async {
          next(action);

          await audioPlayerService.resume();
        });
}
