import 'package:flutter/material.dart';
import 'package:property_map/models/user.dart';
import 'package:property_map/property.dart';
import 'package:property_map/screens/authentcation/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  static String id = 'wrapper';

  // Future<List> getKeyplans() async {
  //     dynamic list =  await MapData(secName: "keyplans").getData();
  //     print('*******************************************$list');
  //     return list;
  //   }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // final user = null;
    print('user object is $user');
    if (user == null) {
      return Authenticate();
    } else {      
      return Property();
    }
  }
}
