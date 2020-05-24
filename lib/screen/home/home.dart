import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/service/database.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/screen/home/brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void showSettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Text('Bottom Sheet'),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.pink[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Setting'),
              onPressed: () => showSettingPanel(),
            ),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
