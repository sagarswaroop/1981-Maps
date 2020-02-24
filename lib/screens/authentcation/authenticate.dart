import 'package:flutter/material.dart';
import 'package:property_map/screens/authentcation/login_page.dart';
import 'package:property_map/screens/authentcation/register_page.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isSignin = true;

  void toggleScreen() {
    setState(() {
      isSignin = !isSignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isSignin) {
      return LoginScreen(screen: toggleScreen);
    } else {
      return RegisterUser(toggleScreen: toggleScreen);
    }
  }
}
