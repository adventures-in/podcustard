import 'package:flutter/material.dart';
import 'package:podcustard/models/podcast_summary.dart';

class PodcastSummaryTile extends StatelessWidget {
  PodcastSummaryTile(this._summary);

  final PodcastSummary _summary;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(_summary.artworkUrl100),
      title: Text(_summary.collectionName),
      subtitle: Text(_summary.artistName),
      trailing: RaisedButton(
        child: Text('SUBSCRIBE'),
        onPressed: () {},
      ),
    );
  }
}
