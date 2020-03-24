import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:property_map/models/mapdata.dart';

class MapData {
  String secName;
  final databaseReference = FirebaseDatabase.instance.reference();
  MapData({this.secName});

  Future<List> getKeyPlans() async {
    return databaseReference
        .child(secName)
        .once()
        .then((DataSnapshot snapshot) {
      return snapshot.value;
    });
  }

  Future<String> _getDataFile() async {
    return await rootBundle.loadString('data/sectorsDatabase.json');
  }

  getSectorData(secctorList(List<MapModel> arr)) async {
    List<MapModel> list = [];
    String jsonFile = await _getDataFile();
    dynamic data = jsonDecode(jsonFile);
    List secList = data[secName];
    secList.forEach((value) {
      list.add(MapModel(value["name"], value["url"]));
    });
    secctorList(list);
    
  }
}
