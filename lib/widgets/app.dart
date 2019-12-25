import 'package:flutter/material.dart' hide Action;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:podcustard/models/user.dart';
import 'package:podcustard/models/actions.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/widgets/auth_page.dart';
import 'package:podcustard/widgets/main_page.dart';

class PodcustardApp extends StatefulWidget {
  PodcustardApp(this.store);
  final Store<AppState> store;
  @override
  _PodcustardAppState createState() => _PodcustardAppState();
}

class _PodcustardAppState extends State<PodcustardApp> {
  @override
  void initState() {
    super.initState();
    widget.store.dispatch(Action.ObserveAuthState());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoreProvider<AppState>(
        store: widget.store,
        child: StoreConnector<AppState, User>(
          distinct: true,
          converter: (store) => store.state.user,
          builder: (context, user) {
            return (user == null || user.uid == null) ? AuthPage() : MainPage();
          },
        ),
      ),
    );
  }
}
