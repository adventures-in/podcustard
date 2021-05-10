import 'package:podcustard/actions/retrieve_podcast_summaries_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/services/itunes_service.dart';
import 'package:redux/redux.dart';

class RetrievePodcastSummariesMiddleware
    extends TypedMiddleware<AppState, RetrievePodcastSummariesAction> {
  RetrievePodcastSummariesMiddleware(ItunesService itunesService)
      : super((store, action, next) async {
          next(action);

          // retrieve podcast summaries and dispatch action to store result
          final storeAction =
              await itunesService.retrievePodcastSummaries(action.query);
          store.dispatch(storeAction);
        });
}
