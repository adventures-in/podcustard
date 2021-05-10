import 'package:podcustard/actions/clear_podcast_selection_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:redux/redux.dart';

class ClearPodcastSelectionReducer
    extends TypedReducer<AppState, ClearPodcastSelectionAction> {
  ClearPodcastSelectionReducer()
      : super(
          (state, action) => state.copyWith(detailVM: null),
        );
}
