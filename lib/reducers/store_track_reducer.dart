import 'package:podcustard/actions/store_track_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:redux/redux.dart';

class StoreTrackReducer extends TypedReducer<AppState, StoreTrackAction> {
  StoreTrackReducer()
      : super(
          (state, action) => state.copyWith(track: action.track),
        );
}
