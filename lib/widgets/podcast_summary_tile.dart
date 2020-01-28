import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:podcustard/models/actions.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/podcast_summary.dart';
import 'package:podcustard/widgets/podcast_detail_page.dart';

class PodcastSummaryTile extends StatelessWidget {
  PodcastSummaryTile(this._summary);

  final PodcastSummary _summary;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(_summary.artworkUrl100),
      title: Text(_summary.collectionName),
      subtitle: Text(_summary.artistName),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        StoreProvider.of<AppState>(context)
            .dispatch(SelectPodcast(podcast: _summary));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PodcastDetailPage()),
        );
      },
    );
  }
}
