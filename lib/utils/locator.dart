import 'package:http/http.dart';
import 'package:podcustard/plugins/wrappers/audio_wrapper.dart';
import 'package:podcustard/services/audio_player_service.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:podcustard/services/itunes_service.dart';

class Locator {
  static ItunesService getItunesService() => _iTunes ?? ItunesService(_client!);
  static FeedsService getFeedsService() => _feeds ?? FeedsService(_client!);
  static AudioPlayerService getAudioPlayerService() =>
      _audioPlayer ?? AudioPlayerService(_audioWrapper!);

  static void provide(
      {required Client client,
      required AudioWrapper audioWrapper,
      required ItunesService iTunes,
      required FeedsService feeds,
      required AudioPlayerService audioPlayer}) {
    _client = client;
    _audioWrapper = audioWrapper;
    _iTunes = iTunes;
    _feeds = feeds;
    _audioPlayer = audioPlayer;
  }

  static void provideOnly(
      {Client? client,
      AudioWrapper? audioWrapper,
      ItunesService? iTunes,
      FeedsService? feeds,
      AudioPlayerService? audioPlayer}) {
    _client = client;
    _iTunes = iTunes;
    _feeds = feeds;
    _audioPlayer = audioPlayer;
  }

  static Client? _client;
  static AudioWrapper? _audioWrapper;
  static ItunesService? _iTunes;
  static FeedsService? _feeds;
  static AudioPlayerService? _audioPlayer;
}
