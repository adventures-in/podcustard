import 'package:podcustard/actions/retrieve_podcast_summaries_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/utils/locator.dart';
import 'package:redux/redux.dart';

class RetrievePodcastSummariesMiddleware
    extends TypedMiddleware<AppState, RetrievePodcastSummariesAction> {
  RetrievePodcastSummariesMiddleware()
      : super((store, action, next) async {
          next(action);

          final itunesService = Locator.getItunesService();

          // retrieve podcast summaries and dispatch action to store result
          final storeAction =
              await itunesService.retrievePodcastSummaries(action.query);
          store.dispatch(storeAction);
        });
}
