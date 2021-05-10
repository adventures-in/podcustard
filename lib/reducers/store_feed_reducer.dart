import 'package:podcustard/actions/store_feed_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:redux/redux.dart';

class StoreFeedReducer extends TypedReducer<AppState, StoreFeedAction> {
  StoreFeedReducer()
      : super(
          (state, action) => state.copyWith(
            detailVM: state.detailVM?.copyWith(feed: action.feed),
          ),
        );
}
