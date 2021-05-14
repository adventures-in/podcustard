import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/actions/redux_action.dart';

part 'store_track_position_action.freezed.dart';
part 'store_track_position_action.g.dart';

@freezed
class StoreTrackPositionAction with _$StoreTrackPositionAction, ReduxAction {
  factory StoreTrackPositionAction(double position) = _StoreTrackPositionAction;

  factory StoreTrackPositionAction.fromJson(Map<String, Object?> json) =>
      _$StoreTrackPositionActionFromJson(json);
}
