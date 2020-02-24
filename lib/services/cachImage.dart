import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget cachIamge(String url) {
  return CachedNetworkImage(
    imageUrl: url,
    placeholder: (context, url) => Center(child: CircularProgressIndicator(backgroundColor: Colors.black,)),
    errorWidget: (context, url, error) => Icon(Icons.error),
    fit: BoxFit.cover,
  );
}
