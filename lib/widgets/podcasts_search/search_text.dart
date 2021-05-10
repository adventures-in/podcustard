import 'package:flutter/material.dart' hide Action;
import 'package:podcustard/actions/retrieve_podcast_summaries_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:redux/redux.dart';

class SearchText extends StatefulWidget {
  SearchText(this._store, {Key? key}) : super(key: key);

  final Store<AppState> _store;

  @override
  _SearchTextState createState() => _SearchTextState();
}

class _SearchTextState extends State<SearchText> {
  // instance variables of the state object
  // StreamSubscription<AppState> _subscription;
  late final TextEditingController _controller;
  // keep the last query that was emitted
  // String _lastQuery;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    // // watch the state and change text with the controller
    // _subscription = widget._store.onChange
    //     // Only use new or null query to update the textfield.
    //     // Let null through so we can reset text in the textfield even before
    //     // anything was stored
    //     .where((state) => state.searchQuery != _lastQuery)
    //     .listen((state) async {
    //   _lastQuery = state.searchQuery;
    //   // set the text with the controller
    //   if (_lastQuery == null) {
    //     _controller.clear();
    //   } else {
    //     _controller.value = _controller.value.copyWith(
    //       text: _lastQuery,
    //       selection: TextSelection.collapsed(offset: 0),
    //     );
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (text) =>
          widget._store.dispatch(RetrievePodcastSummariesAction(text)),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: 'Search for...',
          fillColor: Colors.white70),
    );
  }

  @override
  void dispose() {
    // _subscription.cancel();
    _controller.dispose();
    super.dispose();
  }
}
