import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  TitleText({@required this.text});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      color: Colors.white60,
      child: Center(
      child: Text(text, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),),
      ),
    );
  }
}
