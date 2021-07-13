import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/enums/track_state_enum.dart';
import 'package:redfire/types.dart';

part 'store_track_state_action.freezed.dart';
part 'store_track_state_action.g.dart';

@freezed
class StoreTrackStateAction with _$StoreTrackStateAction, ReduxAction {
  factory StoreTrackStateAction(TrackStateEnum state) = _StoreTrackStateAction;

  factory StoreTrackStateAction.fromJson(Map<String, Object?> json) =>
      _$StoreTrackStateActionFromJson(json);
}
