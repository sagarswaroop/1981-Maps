import 'package:flutter/material.dart';
import 'package:property_map/models/user.dart';
import 'package:property_map/property.dart';
import 'package:property_map/screens/login_screen.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  static String id = 'wrapper';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print('user object is $user');
    if (user == null) {
      return LoginScreen();
    } else {      
      return Property();
    }
  }
}
