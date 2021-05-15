import 'package:podcustard/middleware/middleware_middleware.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/reducers/app_reducer.dart';
import 'package:podcustard/services/audio_player_service.dart';
import 'package:podcustard/services/auth_service.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:podcustard/services/itunes_service.dart';
import 'package:redux/redux.dart';

import '../firebase/fake_firebase_auth.dart';
import '../plugins/apple_signin_mocks.dart';
import '../plugins/google_signin_mocks.dart';
import '../plugins/http_client_mocks.dart';
import '../services/audio_player_service_mocks.dart';

/// The services default to real services with fake backends.
class FakedOutStore extends Store<AppState> {
  FakedOutStore({
    AppState? appState,
    AuthService? authService,
    AudioPlayerService? audioPlayerService,
    FeedsService? feedsService,
    ItunesService? iTunesService,
  }) : super(
          appReducer,
          initialState: appState ?? AppState.init(),
          middleware: [
            ...createMiddleware(
                authService: authService ??
                    AuthService(FakeFirebaseAuth(), FakeGoogleSignIn(),
                        FakeAppleSignIn()),
                audioPlayerService: audioPlayerService ??
                    AudioPlayerService(FakeAudioPlayerObject()),
                feedsService: feedsService ??
                    FeedsService(FakeHttpClient(response: 'test_response')),
                iTunesService: iTunesService ??
                    ItunesService(FakeHttpClient(response: 'test_response'))),
          ],
        );
}
