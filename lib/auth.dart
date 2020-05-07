import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth{
  Future<String> signInWithEmailAndPassword(String email,String password);
  Future<String> createWithEmailAndPassword(String email,String password);
  Future<String> currentUser();
  Future<void> signOut();
}

class Auth implements BaseAuth{
  Future<String> signInWithEmailAndPassword(String email,String password) async{
    FirebaseUser user = (await FirebaseAuth.instance
        .signInWithEmailAndPassword(
    email: email, password: password) ).user;
    return user.uid;
  }

  Future<String> createWithEmailAndPassword(String email,String password) async{
    FirebaseUser user = (await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: email, password: password)).user ;
    return user.uid;
  }
  Future<String> currentUser() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
     return user.uid;
  }
  Future<void> signOut()   async{
   return await FirebaseAuth.instance.signOut();

  }

}