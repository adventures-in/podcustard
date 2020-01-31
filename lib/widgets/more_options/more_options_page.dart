import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:podcustard/widgets/more_options/dark_mode_toggle.dart';

class MoreOptionsPage extends StatelessWidget {
  const MoreOptionsPage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: RaisedButton(
            child: Text('SIGN OUT'),
            onPressed: () {
              GoogleSignIn().disconnect();
              FirebaseAuth.instance.signOut();
            },
          ),
        ),
        DarkModeToggle(),
      ],
    );
  }
}
