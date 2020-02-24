import 'package:firebase_auth/firebase_auth.dart';
import 'package:property_map/models/user.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFormFirbaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream.
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFormFirbaseUser);
  }

  //sign in method.
  Future signningAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      print('user is ${user.uid}');
      return _userFormFirbaseUser(user);
      // return user;
    } catch (e) {
      print("There is some error while singing $e");
      return null;
    }
  }

  //sign in with email and password.

  Future signInEmailnPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFormFirbaseUser(user);
    } catch (e) {
      print('There is some error while sign in $e');
      return null;
    }
  }

  // register with email and password.

  Future registerEmailnPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFormFirbaseUser(user);
    } catch (e) {
      print('Error while Registering is $e');
      return null;
    }
  }

  //sign out.

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('Sign out Error is $e');
      return null;
    }
  }
}
