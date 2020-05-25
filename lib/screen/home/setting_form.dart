import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/service/database.dart';

import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> falvour = <String>[
    'Vanilla',
    'StrawBerry',
    'ButterScotch',
    'Chocolate'
  ];

  String _currentname;
  String _currentfalvour;
  int _currentnoOfScoops;
  int _currentmixture;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update Your Preferences',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) => val.isEmpty ? 'Enter an Name' : null,
                    onChanged: (val) {
                      setState(() => _currentname = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  //Dropdown
                  Slider(
                    value: (_currentmixture ?? userData.mixture).toDouble(),
                    activeColor:
                        Colors.pink[_currentmixture ?? userData.mixture],
                    inactiveColor: Colors.blue,
                    min: 100.0,
                    max: 500.0,
                    divisions: 4,
                    onChanged: (val) {
                      setState(() => _currentmixture = val.round());
                    },
                  ),
                  SizedBox(height: 10.0),
                  DropdownButtonFormField(
                    value: _currentfalvour ?? userData.falvour,
                    decoration: textInputDecoration,
                    items: falvour.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar flavour'),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() => _currentfalvour = val);
                    },
                  ),
                  Slider(
                    value:
                        (_currentnoOfScoops ?? userData.noOfScoops).toDouble(),
                    activeColor:
                        Colors.pink[_currentnoOfScoops ?? userData.noOfScoops],
                    inactiveColor: Colors.blue,
                    min: 100.0,
                    max: 900.0,
                    divisions: 8,
                    onChanged: (val) {
                      setState(() => _currentnoOfScoops = val.round());
                    },
                  ),
                  RaisedButton(
                    color: Colors.pink,
                    child: Text('Update'),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await DatabaseService(uid: user.uid).updateUserData(
                            _currentfalvour ?? userData.falvour,
                            _currentname ?? userData.name,
                            _currentnoOfScoops ?? userData.noOfScoops,
                            _currentmixture ?? userData.mixture);
                      }
                    },
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
