import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:property_map/cstmwidgets/customeloading.dart';
import 'package:property_map/cstmwidgets/image_view.dart';
import 'package:property_map/services/cachImage.dart';

class Map extends StatefulWidget {
  final String mapName;
  final String mapUrl;
  bool isList;
  // final List mapList;
  Map({this.mapName, this.mapUrl, this.isList});

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  void initState() {
    super.initState();
  }

  Widget loadingBar() {
    return GridTile(
        child: Center(
            child: CircularProgressIndicator(
      backgroundColor: Colors.red,
    )));
  }

  Widget decideGridTile(String mapName, String urlName) {
    print("map name is $mapName & and url is $urlName");
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Card(
        elevation: 2.0,
        child: Hero(
            tag: widget.mapName,
            child: Material(
                child: InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageView(
                                image:
                                    CachedNetworkImageProvider(widget.mapUrl),
                                text: widget.mapName,
                              )));
                });
              },
              child: GridTile(
                  footer: Container(
                    padding: EdgeInsets.only(left: 20),
                    color: Colors.black38,
                    child: ListTile(
                      leading: Text(
                        widget.mapName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15.0),
                      ),
                    ),
                  ),
                  child: cachIamge(widget.mapUrl)),
            ))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.isList
        ? decideGridTile(widget.mapName, widget.mapUrl)
        : Loading();
  }
}
