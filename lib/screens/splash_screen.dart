import 'dart:async';

import 'package:flutter/material.dart';
import 'package:property_map/models/user.dart';
import 'package:property_map/screens/constants.dart';
import 'package:property_map/wrapper.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  User user;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Wrapper.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<User>(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            fit: BoxFit.cover,
            image: AssetImage('images/splash_backgorund.jpg'),
          ),
          Opacity(
            opacity: 0.2,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [firstColor, secondColor],
                ),
              ),
              color: Colors.blueAccent[300],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Text("helo"),
                          Container(
                            margin: EdgeInsets.only(top: 200.0),
                            height: 200,
                            width: 200,
                            child: Image(
                                image:
                                    AssetImage('images/ic_launcher_web.png')),
                          ),
                          Text('Check Your Plots',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  letterSpacing: 2.2,
                                  fontFamily: 'OpenSans')),
                        ],
                      ),
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Check it Now.',
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontFamily: 'OpenSans'),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
