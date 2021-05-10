import 'package:podcustard/actions/select_podcast_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/services/feeds_service.dart';
import 'package:redux/redux.dart';

class SelectPodcastMiddleware
    extends TypedMiddleware<AppState, SelectPodcastAction> {
  SelectPodcastMiddleware(FeedsService feedsService)
      : super((store, action, next) async {
          next(action);

          // retrieve feed and dispatch action to store result
          final storeAction =
              await feedsService.retrieveFeed(action.selection.feedUrl!);
          store.dispatch(storeAction);
        });
}
