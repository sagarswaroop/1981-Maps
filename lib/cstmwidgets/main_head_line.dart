import 'package:flutter/material.dart';

class AuthHeadlinText extends StatelessWidget {
  final String text;
  final Color textcolor;
  final double fontSize;

  AuthHeadlinText({@required this.text, this.textcolor,this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          text,
          style: TextStyle(color: textcolor, fontSize: fontSize),
          textAlign: TextAlign.left,
        ));
  }
}