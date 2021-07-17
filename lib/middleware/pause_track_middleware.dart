import 'package:podcustard/actions/pause_track_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/utils/locator.dart';
import 'package:redux/redux.dart';

class PauseTrackMiddleware extends TypedMiddleware<AppState, PauseTrackAction> {
  PauseTrackMiddleware()
      : super((store, action, next) async {
          next(action);

          final audioPlayerService = Locator.getAudioPlayerService();

          await audioPlayerService.pause();
        });
}
