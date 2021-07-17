import 'package:mockito/annotations.dart';
import 'package:podcustard/services/audio_player_service.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:podcustard/services/itunes_service.dart';

@GenerateMocks([AudioPlayerService, FeedsService, ItunesService])
class ServiceTestDoubles {}
