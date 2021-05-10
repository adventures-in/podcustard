import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:podcustard/actions/store_main_page_index_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/widgets/more_options/more_options_page.dart';
import 'package:podcustard/widgets/podcasts_search/search_page.dart';
import 'package:podcustard/widgets/podcasts_search/search_text.dart';
import 'package:podcustard/widgets/track_state_watcher.dart';

const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
const List<Widget> _widgetOptions = <Widget>[
  Text(
    'Index 0: Home',
    style: optionStyle,
  ),
  Text(
    'Index 1: Business',
    style: optionStyle,
  ),
  SearchPage(),
  MoreOptionsPage(),
];

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      distinct: true,
      converter: (store) => store.state.mainPageIndex,
      builder: (context, selectedIndex) {
        return Scaffold(
          appBar: AppBar(
            title: IndexedStack(
              index: selectedIndex,
              alignment: Alignment.center,
              children: <Widget>[
                const Text('AppBar'),
                const Text('AppBar'),
                SearchText(StoreProvider.of<AppState>(context)),
                const Text('AppBar'),
              ],
            ),
            actions: <Widget>[
              TrackStateWatcher(), // shows bottom sheet on state change
            ],
          ),
          body: Center(
            child: _widgetOptions.elementAt(selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_vert),
                label: 'More',
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (index) => _onItemTapped(context, index),
          ),
        );
      },
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    StoreProvider.of<AppState>(context)
        .dispatch(StoreMainPageIndexAction(index));
  }
}
