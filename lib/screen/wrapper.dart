import 'package:brew_crew/screen/authenticate/authenicate.dart';
import 'package:brew_crew/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home or authenicate widget

    final user=Provider.of<User>(context);
    if(user == null)
    return Authenticate();
    else
    return Home();
  }
}