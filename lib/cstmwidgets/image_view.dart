import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:property_map/screens/constants.dart';

class ImageView extends StatefulWidget {
  final ImageProvider image;
  final String text;

  ImageView({@required this.image, @required this.text});

  @override
  State<StatefulWidget> createState() {
    return _ImageViewState();
  }
}

class _ImageViewState extends State<ImageView> {
  PhotoViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PhotoViewController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: secondColor,
          title: Text(
            widget.text,
            style: TextStyle(fontSize: 22),
          ),
        ),
        body:Container(
          child: PhotoView(
              controller: _controller,
              minScale: PhotoViewComputedScale.contained * 0.8,
              // initialScale: 3.0,

              imageProvider: widget.image),
        ),
      );
  }
}
