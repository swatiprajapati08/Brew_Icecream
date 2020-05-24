import 'package:brew_crew/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/service/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.pink[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('logout')),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
