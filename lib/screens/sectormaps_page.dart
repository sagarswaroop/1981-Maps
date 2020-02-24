import 'package:flutter/material.dart';
import 'package:property_map/models/mapdata.dart';
import 'package:property_map/screens/constants.dart';
import 'package:property_map/screens/map.dart';
import 'package:property_map/services/datasharing.dart';

class Maps extends StatefulWidget {
  static String id = 'Map';
  final String text;

  Maps({this.text});

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  List<MapModel> mapList = [];
  bool isList = false;

  @override
  void initState() {
    super.initState();
    MapData(secName: widget.text).getData(this.initiliseData);
  }

  void initiliseData(List<MapModel> arr) {
    setState(() {
      this.mapList = arr;
      this.isList = true;
    });
  }

  Widget isMapLoad(){
    if(isList == false){
      return Center(
          child: CircularProgressIndicator(),
      );
    }
    else {
      return GridView.builder(
          itemCount: mapList.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Map(
              mapName: (this.mapList[index]).name,
              mapUrl: (this.mapList[index]).url,
              isList: isList,
            );
          },
    );
    }
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
      body: isMapLoad(),
    );
  }
}
