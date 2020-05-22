import 'package:brew_crew/screen/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/screen/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleview() {
    setState(() {
      showSignIn = !showSignIn; //complement
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn == true)
      return SignIn(toggleview: toggleview);
    else
      return Register(toggleview: toggleview);
  }
}
