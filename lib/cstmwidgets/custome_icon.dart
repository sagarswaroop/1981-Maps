import 'package:flutter/material.dart';
import 'package:property_map/screens/constants.dart';

class CustomIconButton extends StatelessWidget{
  final Function onPressed;
  final IconData icon;

  CustomIconButton({this.icon,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration:
        BoxDecoration(color: firstColor, shape: BoxShape.circle),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}