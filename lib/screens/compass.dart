import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

import 'package:property_map/screens/constants.dart';

class Compass extends StatefulWidget {
  static String id = 'compass_screen';

  @override
  State<StatefulWidget> createState() {

    return _CompassState();
  }
}

class _CompassState extends State<Compass> {
  double _direction;

  @override
  void initState() {
    super.initState();
    FlutterCompass.events.listen((double direction) {
      setState(() {
        _direction = direction;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Compass'),
          backgroundColor: secondColor,),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: Text(
                'Heading',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              _direction.toStringAsFixed(2),
              style: TextStyle(fontSize: 40),
            ),
            Text('degrres'),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 0),
                padding: EdgeInsets.all(50),
                alignment: Alignment.center,
                child: new Transform.rotate(
                  angle: ((_direction ?? 0) * (math.pi / 180) * -1),
                  child: Image(
                  image: AssetImage(
                        'images/compass.png'),
                  ),
                ),
              ),
            ),
          ],
        )),
    );
  }
}