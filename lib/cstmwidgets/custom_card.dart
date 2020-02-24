import 'package:flutter/material.dart';

class CustomCards extends StatelessWidget {
  final String text;
  final Function onPressed;

  CustomCards({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
        onTap: onPressed,
        child: Container(
            margin: EdgeInsets.all(12),
            child:Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset('images/menu_bg.png')
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25, left: 10),
                child: Center(              
                child: Text('sec 36',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      letterSpacing: 2.2,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'OpenSans')
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
