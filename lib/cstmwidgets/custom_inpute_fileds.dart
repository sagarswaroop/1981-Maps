import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function onChanged;
  final TextInputType keyboardType;
  final String labelText;
  final Widget prefix;
  final bool obscureText;
  final Widget suffix;
  final String hintText;

  CustomInputField(
      {this.controller,
      this.onChanged,
      this.prefix,
      this.labelText,
      this.keyboardType,
      this.obscureText = false,
      this.suffix,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        onChanged: onChanged,
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                    width: 1.0, color: Colors.blue, style: BorderStyle.solid)),
            // hintStyle: TextStyle(color: Colors.white),
            prefixIcon: prefix,
            labelText: labelText,
            hintText: hintText,
            // labelStyle: TextStyle( color: Colors.white, decorationColor: Colors.white),
            suffix: suffix),
      ),
    );
  }
}
