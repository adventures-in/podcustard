import 'package:podcustard/actions/observe_audio_player_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/utils/locator.dart';
import 'package:redux/redux.dart';

class ObserveAudioPlayerMiddleware
    extends TypedMiddleware<AppState, ObserveAudioPlayerAction> {
  ObserveAudioPlayerMiddleware()
      : super((store, action, next) async {
          next(action);

          final audioPlayerService = Locator.getAudioPlayerService();

          // listen to the stream of audio player events and dispatch actions
          audioPlayerService.streamOfAudioEvents.listen(store.dispatch);
        });
}
