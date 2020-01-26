import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/models/podcast_detail_view_model.dart';

class PodcastDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: StoreConnector<AppState, PodcastDetailViewModel>(
        distinct: true,
        converter: (store) => store.state.detailVM,
        builder: (context, vm) {
          if (vm == null || vm.feed == null) return CircularProgressIndicator();

          return Column(
            children: <Widget>[
              Text('artist name: ${vm.summary.artistName}'),
              Text('title: ${vm.feed.title}'),
            ],
          );
        },
      ),
    );
  }
}
