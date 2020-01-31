import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:podcustard/models/actions.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/podcast_detail_view_model.dart';
import 'package:podcustard/widgets/podcast_detail/episode_tile.dart';

class PodcastDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        StoreProvider.of<AppState>(context).dispatch(ClearPodcastSelection());
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Material(
          child: StoreConnector<AppState, PodcastDetailViewModel>(
            distinct: true,
            converter: (store) => store.state.detailVM,
            builder: (context, vm) {
              if (vm == null) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children: <Widget>[
                  Image.network(vm.summary.artworkUrl600),
                  Text('${vm.summary.collectionName}'),
                  Text('${vm.summary.artistName}'),
                  if (vm.feed == null)
                    CircularProgressIndicator()
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: vm.feed.items.length,
                        itemBuilder: (context, index) {
                          return EpisodeTile(episode: vm.feed.items[index]);
                        },
                      ),
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
