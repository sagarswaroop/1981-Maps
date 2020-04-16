import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:property_map/cstmwidgets/customeloading.dart';
import 'package:property_map/cstmwidgets/register_input_fileds.dart';
import 'package:property_map/services/auth.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();

  loadMessage() {}
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  String _userContact;
  bool loading = false;
  bool isConnection = false;

  @override
  void initState() {
    super.initState();
  }

  checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.none) {
      Toast.show("No internet Connection", context, duration: 3);
    } else if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      setState(() {
        isConnection = true;
        print("is connection is called $isConnection");
      });
    }
  }

  void _validationSubmition(BuildContext context) async {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      if (isConnection == false) {
        checkInternetConnectivity();
      } else
        _auth.verifyPhone(_userContact, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.black12,
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('images/home_bg.png'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              )),
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Center(
                      child: Form(
                        key: _formKey,
                        child: _getFormUI(),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }

  Widget _getFormUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset("images/ic_launcher_web.png", height: 200, width: 200),
        SizedBox(
          height: 20.0,
        ),
        CustomRegisterInputField(
            labelText: 'Mobile Number',
            hintText: 'Enter Your Mobile Number',
            keyboardType: TextInputType.phone,
            onTap: () {
              _validationSubmition(context);
            },
            prefix: Icon(Icons.phone),
            validator: (number) {
              if (number == '') {
                return "Filed Can't be Emplty";
              } else if (number.length < 10) {
                return "Please Enter a valid Number";
              }
              return null;
            },
            onSaved: (no) => _userContact = ('+91' + no)),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(width: 40.0),
            Icon(Icons.info, color: Colors.white, size: 25.0),
            SizedBox(width: 10.0),
            Expanded(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'We will send ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400)),
                TextSpan(
                    text: 'One Time Password',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700)),
                TextSpan(
                    text: ' to this mobile number',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400)),
              ])),
            ),
            SizedBox(width: 20.0),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 80, right: 80),
          child: SizedBox(
            height: 20,
            child: Divider(
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 50, right: 50, bottom: 10),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: RaisedButton(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.red[800],
              child: Text('Verify Yourself'),
              onPressed: () {
                _validationSubmition(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
