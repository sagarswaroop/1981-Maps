import 'package:flutter/material.dart';

inputOTP(BuildContext context, {Function onPressed}){
  return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text("Enter the Code"),
                content: Column(
                  children: <Widget>[TextField()],
                ),
                actions: <Widget>[
                  FlatButton(
                    onPressed: onPressed,
                    child: Text("confirm"),
                    textColor: Colors.white,
                    color: Colors.blue,
                  )
                ],
              );
            });
}