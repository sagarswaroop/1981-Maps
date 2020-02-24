import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:property_map/screens/constants.dart';

class FlipImage extends StatefulWidget {
  final int image;
  final List imageList;
  // final String text;

  FlipImage({@required this.image,@required this.imageList});

  @override
  State<StatefulWidget> createState() {
    return _FlipImageState();
  }
}

class _FlipImageState extends State<FlipImage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: secondColor,
          title: Text(
            appTitle,
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: Container(
            child: PhotoViewGallery.builder(
          itemCount: widget.imageList.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: CachedNetworkImageProvider(widget.imageList[widget.image+index] < (5)),
              minScale: PhotoViewComputedScale.contained * 0.8,
            );
          },
          scrollPhysics: BouncingScrollPhysics(),
          backgroundDecoration: BoxDecoration(
          color: Colors.black,
          ),
          loadingChild: Center(
            child: CircularProgressIndicator(),
          ),
        )));
  }
}
