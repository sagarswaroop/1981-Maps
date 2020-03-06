import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:property_map/models/user.dart';
import 'package:property_map/wrapper.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String smsOTP;
  String verificationId;
  String errorMessage = '';

  User _userFormFirbaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream.
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFormFirbaseUser);
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

  Future isNumberVerified(AuthCredential credential) async {
    try {
      AuthResult result = await _auth.signInWithCredential(credential);
      FirebaseUser user = result.user;
      _userFormFirbaseUser(user);
    } catch (e) {
      print("Ther is some error in sign in $e");
      // errorMessage(e);
      errorMessage = "Check Network Connection";
    }
  }

  isphoneRegisterationException(AuthException exception) {
    print("exception is ${exception.message}");
    errorMessage = "Please Try again";
  }

  Future<void> verifyPhone(String mobileNo, BuildContext context) async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsOTPDialog(context).then((value) {
        print("Sign in successfully");
      });
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: mobileNo, // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            this.verificationId = verId;
          },
          codeSent:
              smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          timeout: Duration(seconds: 60),
          verificationCompleted: isNumberVerified,
          verificationFailed: isphoneRegisterationException);
    } catch (e) {
      print("try block error $e");
      errorMessage = "Please try again";
    }
  }

  Future<bool> smsOTPDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter SMS Code'),
            content: Container(
              height: 85,
              child: Column(children: [
                TextField(
                  onChanged: (value) {
                    this.smsOTP = value;
                  },
                ),
                (errorMessage != ''
                    ? Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red),
                      )
                    : Container())
              ]),
            ),
            contentPadding: EdgeInsets.all(10),
            actions: <Widget>[
              FlatButton(
                child: Text('Done'),
                onPressed: () {
                  _auth.currentUser().then((user) {
                    if (user != null) {
                      Navigator.of(context).pop();
                      Navigator.pushReplacementNamed(context, Wrapper.id);
                    } else {
                      signIn(context);
                    }
                  });
                },
              )
            ],
          );
        });
  }

  signIn(BuildContext context) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      AuthResult result = await _auth.signInWithCredential(credential);
      FirebaseUser user = result.user;
      Navigator.of(context).pop();
      _userFormFirbaseUser(user);
    } catch (e) {
      print("There is some error in sign out $e");
      errorMessage = "Try again after some time";
    }
  }
}
