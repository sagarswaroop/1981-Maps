// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:property_map/cstmwidgets/caousalcard.dart';
// import 'package:property_map/cstmwidgets/image_view.dart';
// import 'package:property_map/screens/constants.dart';

// class Navbar extends StatefulWidget {
//   final List keyplans;
//   Navbar({this.keyplans});

//   @override
//   _NavbarState createState() => _NavbarState();
// }

// class _NavbarState extends State<Navbar> {


//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//           enlargeCenterPage: true,
//           autoPlay: true,
//           height: 350,
//           initialPage: 0,
//           items: keyPlans.map((key) {
//             return new CarousalCard(
//               image: CachedNetworkImageProvider(key),
//               onPressed: () {
//                         setState(() {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ImageView(
//                                       image: CachedNetworkImageProvider(key),
//                                       text: appTitle,
//                                       )));
//                         });
//                       },
//             );
//           }).toList());
//   }
// }