import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:podcustard/models/actions.dart';
import 'package:podcustard/models/podcast_summary.dart';

import 'package:http/http.dart' as http;
import 'package:podcustard/models/problem.dart';

class ItunesService {
  ItunesService(this._httpClient);

  final http.Client _httpClient;

  Future<Action> retrievePodcastSummaries({@required String query}) async {
    final queryNoSpaces = query.replaceAll(RegExp(' '), '+');
    try {
      var uriResponse = await _httpClient.get(
        'https://itunes.apple.com/search?term=$queryNoSpaces&entity=podcast',
      );
      // cast the decoded json to the correct type piece by piece
      // and collect the addresses in a list
      final decodedJson = jsonDecode(uriResponse.body) as Map<String, dynamic>;
      final jsonResultsList = decodedJson['results'] as List<dynamic>;

      final summariesList = <PodcastSummary>[];
      // go through results and create dart objects
      for (var jsonResult in jsonResultsList) {
        final summary = PodcastSummary((b) => b
          ..artistId = jsonResult['artistId'] as int
          ..collectionId = jsonResult['collectionId'] as int
          ..trackId = jsonResult['trackId'] as int
          ..trackCount = jsonResult['trackCount'] as int
          ..releaseDate = DateTime.parse(jsonResult['releaseDate'] as String)
          ..artistName = jsonResult['artistName'] as String
          ..collectionName = jsonResult['collectionName'] as String
          ..trackName = jsonResult['trackName'] as String
          ..artistViewUrl = jsonResult['artistViewUrl'] as String
          ..collectionViewUrl = jsonResult['collectionViewUrl'] as String
          ..feedUrl = jsonResult['feedUrl'] as String
          ..trackViewUrl = jsonResult['trackViewUrl'] as String
          ..artworkUrl30 = jsonResult['artworkUrl30'] as String
          ..artworkUrl60 = jsonResult['artworkUrl60'] as String
          ..artworkUrl100 = jsonResult['artworkUrl100'] as String
          ..artworkUrl600 = jsonResult['artworkUrl600'] as String
          ..country = jsonResult['country'] as String
          ..primaryGenreName = jsonResult['primaryGenreName'] as String
          ..genreIds = ListBuilder<String>(
              List<String>.from(jsonResult['genreIds'] as List<dynamic>))
          ..genres = ListBuilder<String>(
              List<String>.from(jsonResult['genres'] as List<dynamic>)));
        summariesList.add(summary);
      }

      // Create an action and return
      return Action.StorePodcastSummaries(summaries: summariesList);
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
