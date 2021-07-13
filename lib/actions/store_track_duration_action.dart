import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'store_track_duration_action.freezed.dart';
part 'store_track_duration_action.g.dart';

@freezed
class StoreTrackDurationAction with _$StoreTrackDurationAction, ReduxAction {
  factory StoreTrackDurationAction(double duration) = _StoreTrackDurationAction;

  factory StoreTrackDurationAction.fromJson(Map<String, Object?> json) =>
      _$StoreTrackDurationActionFromJson(json);
}
