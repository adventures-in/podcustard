import 'package:podcustard/actions/store_track_duration_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:redux/redux.dart';

class StoreTrackDurationReducer
    extends TypedReducer<AppState, StoreTrackDurationAction> {
  StoreTrackDurationReducer()
      : super(
          (state, action) => state.copyWith(
            track: state.track?.copyWith(duration: action.duration),
          ),
        );
}
