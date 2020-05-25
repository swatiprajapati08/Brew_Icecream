import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/service/database.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> mixtures = ['0', '1', '2', '3'];
  final List<String> falvour = <String>[
    'Vanilla',
    'StrawBerry',
    'ButterScotch',
    'Chocolate'
  ];

  String _currentname;
  String _currentfalvour;
  int _currentnoOfscoop;
  int _currentmixture;

  @override
  Widget build(BuildContext context) {

    final user=Provider.of<User>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        


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
                decoration: textInputDecoration,
                validator: (val) => val.isEmpty ? 'Enter an Name' : null,
                onChanged: (val) {
                  setState(() => _currentname = val);
                },
              ),
              SizedBox(height: 20.0),
              //Dropdown
              Slider(
                value: (_currentmixture ?? 1).toDouble(),
                activeColor: Colors.pink[_currentmixture ?? 1],
                inactiveColor: Colors.blue,
                min: 1,
                max: 5,
                divisions: 4,
                onChanged: (val) {
                  setState(() => _currentmixture = val.round());
                },
              ),
              SizedBox(height: 10.0),
              DropdownButtonFormField(
                value: _currentfalvour ?? 'Vanilla',
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
                value: (_currentnoOfscoop ?? 100).toDouble(),
                activeColor: Colors.pink[_currentnoOfscoop ?? 10],
                inactiveColor: Colors.blue,
                min: 100,
                max: 900,
                divisions: 8,
                onChanged: (val) {
                  setState(() => _currentnoOfscoop = val.round());
                },
              ),
              RaisedButton(
                color: Colors.pink,
                child: Text('Update'),
                onPressed: () async {
                  print(_currentname);
                  print(_currentmixture);
                  print(_currentfalvour);
                  print(_currentnoOfscoop);
                },
              ),
            ],
          ),
        );
      }
    );
  }
}
