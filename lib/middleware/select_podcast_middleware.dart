import 'package:podcustard/actions/select_podcast_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/utils/locator.dart';
import 'package:redux/redux.dart';

class SelectPodcastMiddleware
    extends TypedMiddleware<AppState, SelectPodcastAction> {
  SelectPodcastMiddleware()
      : super((store, action, next) async {
          next(action);

          final feedsService = Locator.getFeedsService();

          // retrieve feed and dispatch action to store result
          final storeAction =
              await feedsService.retrieveFeed(action.selection.feedUrl!);
          store.dispatch(storeAction);
        });
}
