import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:property_map/models/user.dart';
import 'package:property_map/screens/login_screen.dart';
import 'package:property_map/screens/otpScreen.dart';
import 'package:property_map/services/database.dart';
import 'package:property_map/services/mailServices.dart';
import 'package:property_map/wrapper.dart';
import 'package:toast/toast.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final LoadData loadData = LoadData();
  String smsOTP;
  String verificationId;
  String errorMessage = '';
  bool isVerified = false;

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

  Future verifyPhone(String mobileNo, BuildContext context) async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsOTPDialog(context, mobileNo);
      errorMessage = "Otp send Successfully";
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: mobileNo, // PHONE NUMBER TO SEND OTP
          codeAutoRetrievalTimeout: (String verId) {
            this.verificationId = verId;
          },
          timeout: Duration(seconds: 60),
          verificationCompleted: (AuthCredential credential) async {
            try {
              AuthResult result = await _auth.signInWithCredential(credential);
              FirebaseUser user = result.user;
              Navigator.of(context).pop();
              LoadData().getPlansData();
              _userFormFirbaseUser(user);
              mail(mobileNo);
            } catch (e) {
              Toast.show("Please Check the Number", context, duration: 3);
            }
          }, //When Number is verified.
          codeSent:
              smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
          verificationFailed: (AuthException exception) {
            print("exception is ${exception.message}");
            Toast.show("Please Try with Another Number", context, duration: 3);
          });
    } catch (e) {
      print("try block error $e");
    }
  }

  smsOTPDialog(BuildContext context, String conNumber) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter SMS Code'),
            content: Container(
              height: 100,
              child: Column(children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      this.smsOTP = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                OtpReader(),
              ]),
            ),
            contentPadding: EdgeInsets.all(10),
            actions: <Widget>[
              Row(
                children: <Widget>[
                  FlatButton(
                    child: Text('Done'),
                    onPressed: () {
                      _auth.currentUser().then((user) {
                        if (user != null) {
                          mail(conNumber);
                          Navigator.of(context).pop();
                          Navigator.pushReplacementNamed(context, Wrapper.id);
                        } else {
                          signIn(context, conNumber);
                        }
                      });
                    },
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  FlatButton(
                    child: Text('cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              )
            ],
          );
        });
  }

  signIn(BuildContext context, String conNumber) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      AuthResult result = await _auth.signInWithCredential(credential);
      FirebaseUser user = result.user;
      if(user!= null){
       Navigator.of(context).pop();
      _userFormFirbaseUser(user);
      mail(conNumber);
      }
      
    } catch (e) {
      print("There is some error in sign out $e");
    }
  }
}
