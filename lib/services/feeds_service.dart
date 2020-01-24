import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:podcustard/models/actions.dart';
import 'package:podcustard/models/problem.dart';
import 'package:rss_dart/models/rss_feed.dart';

class FeedsService {
  FeedsService(this._httpClient);

  final http.Client _httpClient;

  Future<Action> retrieveFeed({@required String url}) async {
    try {
      var uriResponse = await _httpClient.get(url);
      var feed = RssFeed.parse(uriResponse.body);

      // Create an action and return
      return Action.StoreFeed(feed: feed);
    } on Exception catch (e, trace) {
      // if there were any problems collect available info and create an action
      return AddProblem(
          problem: Problem((b) => b
            ..type = ProblemTypeEnum.retrievePodcastSummaries
            ..message = e.toString()
            ..trace = trace.toString()));
    }
  }
}
