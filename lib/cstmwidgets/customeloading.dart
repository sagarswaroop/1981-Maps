import 'package:flutter/material.dart';
import 'package:property_map/screens/constants.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("images/splash_backgorund.jpg",
          fit: BoxFit.cover,),
          Opacity(
            opacity: 0.2,
            child: Container(
              decoration: BoxDecoration(
              gradient: LinearGradient(
              colors: <Color>[Colors.orangeAccent, secondColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
              color: Colors.blueAccent[300],
            ),
          ),
          Center(
            heightFactor: 20.0,
            widthFactor: 20.0,
            child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
          )
        ],
      ),
    );
  }
}