import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:podcustard/middleware/middleware_middleware.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/reducers/app_reducer.dart';
import 'package:podcustard/services/audio_player_service.dart';
import 'package:podcustard/services/auth_service.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:podcustard/services/itunes_service.dart';
import 'package:podcustard/utils/apple_signin_object.dart';
import 'package:podcustard/utils/audio_player_object.dart';
import 'package:podcustard/utils/store_operation.dart';
import 'package:redux/redux.dart';

/// Services can be injected, or if missing are given default values
class ReduxBundle {
  static var _bucketName = 'gs://crowdleague-profile-pics';
  static var _extraMiddlewares = <Middleware<AppState>>[];
  static var _storeOperations = <StoreOperation>[];
  static final _httpClient = Client();

  static void setup(
      {String? bucketName,
      List<Middleware<AppState>>? extraMiddlewares,
      List<StoreOperation>? storeOperations}) {
    _bucketName = bucketName ?? _bucketName;
    _extraMiddlewares = extraMiddlewares ?? _extraMiddlewares;
    _storeOperations = storeOperations ?? _storeOperations;
  }

  /// Services
  final AuthService _authService;
  final ItunesService _iTunesService;
  final FeedsService _feedsService;
  final AudioPlayerService _audioPlayerService;

  ReduxBundle(
      {List<Middleware>? extraMiddlewares,
      AuthService? authService,
      ItunesService? iTunesService,
      FeedsService? feedsService,
      AudioPlayerService? audioPlayerService})
      : _authService = authService ??
            AuthService(FirebaseAuth.instance,
                GoogleSignIn(scopes: <String>['email']), AppleSignInObject()),
        _iTunesService = iTunesService ?? ItunesService(_httpClient),
        _feedsService = feedsService ?? FeedsService(_httpClient),
        _audioPlayerService =
            audioPlayerService ?? AudioPlayerService(AudioPlayerObject());

  Future<Store<AppState>> createStore() async {
    final _store = Store<AppState>(
      appReducer,
      initialState: AppState.init(),
      middleware: [
        ...createMiddleware(
            authService: _authService,
            iTunesService: _iTunesService,
            feedsService: _feedsService,
            audioPlayerService: _audioPlayerService),
        ..._extraMiddlewares
      ],
    );

    // now that we have a store, run any store operations that were added
    for (final operation in _storeOperations) {
      await operation.runOn(_store);
    }

    return _store;
  }
}
