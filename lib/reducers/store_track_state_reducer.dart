import 'package:podcustard/actions/store_track_state_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:redux/redux.dart';

class StoreTrackStateReducer
    extends TypedReducer<AppState, StoreTrackStateAction> {
  StoreTrackStateReducer()
      : super(
          (state, action) => state.copyWith(
            track: state.track?.copyWith(state: action.state),
          ),
        );
}
