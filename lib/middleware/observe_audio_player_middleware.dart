import 'package:podcustard/actions/observe_audio_player_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/services/audio_player_service.dart';
import 'package:redux/redux.dart';

class ObserveAudioPlayerMiddleware
    extends TypedMiddleware<AppState, ObserveAudioPlayerAction> {
  ObserveAudioPlayerMiddleware(AudioPlayerService audioPlayerService)
      : super((store, action, next) async {
          next(action);

          // listen to the stream of audio player events and dispatch actions
          audioPlayerService.streamOfAudioEvents.listen(store.dispatch);
        });
}
