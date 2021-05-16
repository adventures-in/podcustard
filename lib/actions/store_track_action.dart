import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:podcustard/models/track.dart';
import 'package:redfire/types/redux_action.dart';

part 'store_track_action.freezed.dart';
part 'store_track_action.g.dart';

@freezed
class StoreTrackAction with _$StoreTrackAction, ReduxAction {
  factory StoreTrackAction(Track track) = _StoreTrackAction;

  factory StoreTrackAction.fromJson(Map<String, Object?> json) =>
      _$StoreTrackActionFromJson(json);
}
