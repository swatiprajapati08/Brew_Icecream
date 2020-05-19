import 'package:brew_crew/screen/authenticate/authenicate.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home or authenicate widget
    return Authenticate();
  }
}