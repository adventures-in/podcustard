import 'package:http/http.dart';
import 'package:podcustard/plugins/wrappers/audio_player_wrapper.dart';
import 'package:podcustard/services/audio_player_service.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:podcustard/services/itunes_service.dart';

class Locator {
  static ItunesService getItunes() => _iTunes ?? ItunesService(_httpClient!);
  static FeedsService getFeeds() => _feeds ?? FeedsService(_httpClient!);
  static AudioPlayerService getAudioPlayer() =>
      _audioPlayer ?? AudioPlayerService(AudioPlayerWrapper());

  static void provide(ItunesService iTunes) {
    _iTunes = iTunes;
  }

  static Client? _httpClient;
  static ItunesService? _iTunes;
  static FeedsService? _feeds;
  static AudioPlayerService? _audioPlayer;
}
