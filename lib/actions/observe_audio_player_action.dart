import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/actions/redux_action.dart';

part 'observe_audio_player_action.freezed.dart';
part 'observe_audio_player_action.g.dart';

@freezed
class ObserveAudioPlayerAction with _$ObserveAudioPlayerAction, ReduxAction {
  factory ObserveAudioPlayerAction() = _ObserveAudioPlayerAction;

  factory ObserveAudioPlayerAction.fromJson(Map<String, dynamic> json) =>
      _$ObserveAudioPlayerActionFromJson(json);
}