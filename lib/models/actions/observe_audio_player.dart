library observe_audio_player;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import './redux_action.dart';
import '../serializers.dart';

part 'observe_audio_player.g.dart';

abstract class ObserveAudioPlayer extends Object
    with ReduxAction
    implements Built<ObserveAudioPlayer, ObserveAudioPlayerBuilder> {
  ObserveAudioPlayer._();

  factory ObserveAudioPlayer(
          [void Function(ObserveAudioPlayerBuilder) updates]) =
      _$ObserveAudioPlayer;

  Object toJson() =>
      serializers.serializeWith(ObserveAudioPlayer.serializer, this);

  static ObserveAudioPlayer fromJson(String jsonString) => serializers
      .deserializeWith(ObserveAudioPlayer.serializer, json.decode(jsonString));

  static Serializer<ObserveAudioPlayer> get serializer =>
      _$observeAudioPlayerSerializer;
}
