import 'package:firebase_database/firebase_database.dart';
import 'package:property_map/models/mapdata.dart';

class MapData {
  String secName;
  final databaseReference = FirebaseDatabase.instance.reference();
  MapData({this.secName});

  void getData(data(List<MapModel> arr)) {
    databaseReference.child(secName).once().then((DataSnapshot snapshot) {
      List<MapModel> list = [];
      // print("snapshot.value ${snapshot.value}");
      (snapshot.value as List).forEach((value) {
        list.add(MapModel(value["name"], value["url"]));
      });
      data(list);
    });
  }

  void getKeyPlans(data(List arr)) {
    databaseReference.child(secName).once().then((DataSnapshot snapshot) {
      // print('snapshot.value is ${snapshot.value}');
      List list = snapshot.value;
      // print("list is in get key plans is $list");
      data(list);
    });
  }
}
