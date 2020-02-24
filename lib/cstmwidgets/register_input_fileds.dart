import 'package:flutter/material.dart';

class CustomRegisterInputField extends StatelessWidget {
  final TextEditingController controller;
  final Function validator;
  final TextInputType keyboardType;
  final String labelText;
  final Widget prefix;
  final bool obscureText;
  final Widget suffix;
  final String hintText;
  final Function onSaved;

  CustomRegisterInputField(
      {this.controller,
      this.validator,
      this.prefix,
      this.labelText,
      this.keyboardType,
      this.obscureText = false,
      this.suffix,
      this.hintText,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
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
