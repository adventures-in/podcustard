library clear_podcast_selection;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import './redux_action.dart';
import '../serializers.dart';

part 'clear_podcast_selection.g.dart';

abstract class ClearPodcastSelection extends Object
    with ReduxAction
    implements Built<ClearPodcastSelection, ClearPodcastSelectionBuilder> {
  ClearPodcastSelection._();

  factory ClearPodcastSelection(
          [void Function(ClearPodcastSelectionBuilder) updates]) =
      _$ClearPodcastSelection;

  Object toJson() =>
      serializers.serializeWith(ClearPodcastSelection.serializer, this);

  static ClearPodcastSelection fromJson(String jsonString) =>
      serializers.deserializeWith(
          ClearPodcastSelection.serializer, json.decode(jsonString));

  static Serializer<ClearPodcastSelection> get serializer =>
      _$clearPodcastSelectionSerializer;
}
