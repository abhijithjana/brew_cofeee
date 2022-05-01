import 'package:auth/auth.dart';
import 'package:cofee/model/user.dart';
import 'package:cofee/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Users _userfromfirebase(User) {
    return Users(uid: User.uid);
  }

  Stream<Users> get user {
    return _auth.authStateChanges().map(_userfromfirebase);
  }

  Future singnAnno() async {
    try {
      UserCredential credential = await _auth.signInAnonymously();
      User? user = credential.user;
      return _userfromfirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signout() async {
    try {
      return _auth.signOut();
    } catch (e) {
      print("signout failed " + e.toString());
      return null;
    }
  }

  Future Registerwithemailandpassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;
      await Database(uid: user!.uid).updateuser('0', 'new member', 100);
      return _userfromfirebase(user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future SigninwithemailandPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;
      return _userfromfirebase(user);
    } catch (e) {
      print(e.toString());
    }
  }
}
