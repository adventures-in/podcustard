import 'package:podcustard/actions/resume_track_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/utils/locator.dart';
import 'package:redux/redux.dart';

class ResumeTrackMiddleware
    extends TypedMiddleware<AppState, ResumeTrackAction> {
  ResumeTrackMiddleware()
      : super((store, action, next) async {
          next(action);

          final audioPlayerService = Locator.getAudioPlayerService();

          await audioPlayerService.resume();
        });
}
