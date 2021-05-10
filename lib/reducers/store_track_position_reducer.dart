import 'package:podcustard/actions/store_track_position_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:redux/redux.dart';

class StoreTrackPositionReducer
    extends TypedReducer<AppState, StoreTrackPositionAction> {
  StoreTrackPositionReducer()
      : super(
          (state, action) => state.copyWith(
            track: state.track?.copyWith(position: action.position),
          ),
        );
}
