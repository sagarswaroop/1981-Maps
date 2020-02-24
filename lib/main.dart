import 'package:flutter/material.dart';
import 'package:property_map/property.dart';
import 'package:property_map/screens/aboutus_page.dart';
import 'package:property_map/screens/allsector_page.dart';
import 'package:property_map/screens/authentcation/login_page.dart';
import 'package:property_map/screens/authentcation/register_page.dart';
import 'package:property_map/screens/compass.dart';
import 'package:property_map/screens/contactus_page.dart';
import 'package:property_map/screens/sectormaps_page.dart';
import 'package:property_map/screens/splash_screen.dart';
import 'package:property_map/services/auth.dart';
import 'package:property_map/utils/sharefeedback.dart';
import 'package:property_map/wrapper.dart';
import 'package:provider/provider.dart';

void main() {
  setUpLocation();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: AuthServices().user,
        child: MaterialApp(
        title: '1981 MAPS',
        color: Colors.redAccent,
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          RegisterUser.id: (context) => RegisterUser(),
          AboutUs.id: (context) => AboutUs(),
          ContactUs.id: (context) => ContactUs(),
          Compass.id: (context) => Compass(),
          SplashScreen.id: (context) => SplashScreen(),
          Property.id: (context) => Property(),
          AllSectors.id: (context) => AllSectors(),
          Wrapper.id: (context)=> Wrapper(),
          Maps.id:(context)=>Maps(),
        },
      ),
    );
  }
}

