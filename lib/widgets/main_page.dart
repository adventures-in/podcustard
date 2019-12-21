import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Main Page'),
        RaisedButton(
          child: Text('SIGN OUT'),
          onPressed: () {
            GoogleSignIn().disconnect();
            FirebaseAuth.instance.signOut();
          },
        ),
      ],
    );
  }
}
