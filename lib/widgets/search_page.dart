import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/podcast_summary.dart';
import 'package:podcustard/widgets/podcast_summary_tile.dart';

class SearchPage extends StatelessWidget {
  const SearchPage();
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BuiltList<PodcastSummary>>(
      distinct: true,
      converter: (store) => store.state.podcastSummaries,
      builder: (context, summaries) {
        return ListView.builder(
          itemCount: summaries.length,
          itemBuilder: (context, index) {
            return PodcastSummaryTile(summaries[index]);
          },
        );
      },
    );
  }
}
