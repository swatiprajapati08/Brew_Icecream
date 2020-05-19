import 'package:brew_crew/service/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

 final AuthService _auth=AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.pinkAccent[100],
     appBar: AppBar(
       backgroundColor: Colors.pink[400],
       elevation: 0.0,
       title: Text('Sign In to Brew Crew'),
     ),
      body: Container(
        padding : EdgeInsets.symmetric(vertical:20.0,horizontal: 50.0),
       child: RaisedButton(
         child: Text('Sign in anon'),
         color: Colors.blue,
         onPressed: () async{
            dynamic result =await _auth.signInAnon();
            if(result==null)
            print('error sign in');
            else
            {print('Sign in');
            print(result.uid);
            }
         },
        ),
      ),
    );
  }
}