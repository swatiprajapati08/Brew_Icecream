import 'package:brew_crew/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleview;
  Register({this.toggleview});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        elevation: 0.0,
        title: Text(
          'Sign Up  to Brew Crew',
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleview();
            },
            icon: Icon(Icons.person),
            label: Text('Register'),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey, //keep track of form
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: 'password'),
                  obscureText: true,
                  validator: (val) => val.length < 6
                      ? 'Enter a password 6+ char long'
                      : null, //it return null when something is valid
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  }),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState
                      .validate()) //check validation it is inbuilt in flutter if it recieve all null then work
                  {
                    dynamic result = await _auth.registerWithEmailandPassword(
                        email, password);
                    if (result == null)
                      setState(() => error = 'Please enter valid email');
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
