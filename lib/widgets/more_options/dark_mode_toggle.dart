import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:podcustard/models/actions/store_theme_mode.dart';
import 'package:podcustard/models/app_state.dart';

class DarkModeToggle extends StatefulWidget {
  @override
  _DarkModeToggleState createState() => _DarkModeToggleState();
}

class _DarkModeToggleState extends State<DarkModeToggle> {
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: <Widget>[
        Icon(Icons.wb_sunny),
        Icon(Icons.stars),
        Icon(Icons.system_update),
      ],
      onPressed: (int index) {
        StoreProvider.of<AppState>(context)
            .dispatch(StoreThemeMode((b) => b..themeMode = index));
        setState(() {
          for (var i = 0; i < 3; i++) {
            isSelected[i] = false;
          }
          isSelected[index] = !isSelected[index];
        });
      },
      isSelected: isSelected,
    );
  }
}
