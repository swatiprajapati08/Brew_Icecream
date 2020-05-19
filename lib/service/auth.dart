import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/models/user.dart';

class AuthService {

final FirebaseAuth _auth = FirebaseAuth.instance;
//create user obj based on FirebaseUser
User _userFromFirebase(FirebaseUser user)
{
  return user !=null ?User(uid: user.uid) : null;
}


//sign in anon
Future signInAnon() async{
  try
  {
    AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user=result.user;
    return _userFromFirebase(user);
  }
  catch(e){
    print(e.toString());
    return null;
  }
}


//sign with email & password


//register with email & password


//sign out


}
