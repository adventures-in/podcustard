import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:podcustard/actions/build_track_from_episode_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/rss/rss_item.dart';
import 'package:url_launcher/url_launcher.dart';

class EpisodeTile extends StatelessWidget {
  const EpisodeTile({Key? key, required this.episode}) : super(key: key);

  final RssItem episode;

  @override
  Widget build(BuildContext context) {
    final sub = (episode.media!.contents.isEmpty)
        ? ''
        : episode.media!.contents.first.url;
    return ListTile(
      leading: IconButton(
        icon: Icon(Icons.play_circle_filled),
        onPressed: () {
          StoreProvider.of<AppState>(context).dispatch(
              BuildTrackFromEpisodeAction(
                  episode.enclosure!.url!, episode.title!));
          Navigator.pop(context);
        },
      ),
      title: GestureDetector(
          onTap: () {
            _launch(episode.link!);
          },
          child: Text(
            episode.title!,
            style: TextStyle(
                decoration: TextDecoration.underline, color: Colors.blue),
          )),
      subtitle: Text(sub!),
    );
  }

  void _launch(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
