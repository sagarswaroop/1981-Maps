import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:property_map/cstmwidgets/caousalcard.dart';
import 'package:property_map/cstmwidgets/image_view.dart';
import 'package:property_map/cstmwidgets/tile_text.dart';
import 'package:property_map/screens/constants.dart';
import 'package:property_map/screens/print_sectors.dart';
import 'package:property_map/services/directoryservices.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final popularSec = ["Sec-34", "Sec-36", "Sec-37"];
  bool iskeyplans = false;
  List keyPlans = [];

  @override
  void initState() {
    super.initState();
    DirServices().loadKeyPlans(this.getkeyPlans);
  }

  void getkeyPlans(List arr) {
    setState(() {
      keyPlans = arr;
      iskeyplans = true;
    });
  }

  Widget getImage() {
    if (iskeyplans == false) {
      return Center(
          child: CircularProgressIndicator(backgroundColor: Colors.red));
    } else
      return CarouselSlider(
          enlargeCenterPage: true,
          autoPlay: true,
          height: 350,
          initialPage: 0,
          items: keyPlans.map((key) {
            return new CarousalCard(
              image: CachedNetworkImageProvider(key),
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageView(
                                image: CachedNetworkImageProvider(key),
                                text: appTitle,
                              )));
                });
              },
            );
          }).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Colors.orangeAccent, secondColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: <Widget>[getImage()],
            ),
          ),
          TitleText(text: 'POPULAR SECTOR PROPERTY'),
          DispalySectors(
            sectorList: popularSec,
            columns: 3,
            gridHight: 1.4,
          ),
          TitleText(
            text: 'ALL SECTOR PROPERTY',
          ),
          DispalySectors(
            sectorList: sectorsList,
            columns: 2,
          )
        ],
      ),
    );
  }
}
