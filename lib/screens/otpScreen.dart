import 'dart:async';
import 'package:flutter/material.dart';

class OtpReader extends StatefulWidget {
  final String mobNumber;
  OtpReader({Key key, this.mobNumber});

  @override
  _OtpReaderState createState() => _OtpReaderState();
}

class _OtpReaderState extends State<OtpReader> {
  bool isTimeOver = false;

  @override
   void setState(fn) {
    if(mounted){
      super.setState(fn);
    }
    this.initislizeTime();
  }

  initislizeTime() {
    Timer(Duration(seconds: 30), () {
      setState(() {
        isTimeOver = true;
        print("time ober flag is ***************************** $isTimeOver");
      });
    });
  }

  Widget loadMessage() {
    if (isTimeOver == true) {
      return Expanded(child: Text("Check your Number.", style: TextStyle(fontWeight: FontWeight.w800, color: Colors.red ),));
    } else
      return Expanded(
          child: CircularProgressIndicator(
        backgroundColor: Colors.red,
      ));
  }

  @override
  Widget build(BuildContext context) {
    return loadMessage();
  }
}
