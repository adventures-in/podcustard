import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/actions/redux_action.dart';

part 'clear_podcast_selection_action.freezed.dart';
part 'clear_podcast_selection_action.g.dart';

@freezed
class ClearPodcastSelectionAction
    with _$ClearPodcastSelectionAction, ReduxAction {
  factory ClearPodcastSelectionAction() = _ClearPodcastSelectionAction;

  factory ClearPodcastSelectionAction.fromJson(Map<String, dynamic> json) =>
      _$ClearPodcastSelectionActionFromJson(json);
}
