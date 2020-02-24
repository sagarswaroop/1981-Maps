import 'package:flutter/material.dart';

class CarousalCard extends StatelessWidget {
  final ImageProvider image;
  final Function onPressed;

  CarousalCard({this.image, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            image: image,
            fit: BoxFit.fill,
            repeat: ImageRepeat.noRepeat,
          ),
        ),
      ),
    );
  }
}
