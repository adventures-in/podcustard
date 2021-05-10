import 'package:podcustard/actions/store_podcast_summary_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:redux/redux.dart';

class StorePodcastSummaryReducer
    extends TypedReducer<AppState, StorePodcastSummaryAction> {
  StorePodcastSummaryReducer()
      : super(
          (state, action) => state.copyWith(
            detailVM: state.detailVM?.copyWith(summary: action.summary),
          ),
        );
}
