import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> mixture = ['0', '1', '2', '3'];

  String _currentname;
  String _currentfalvour;
  int _noOfscoop;
  int _mixture;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update Your Preferences',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
