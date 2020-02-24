import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property_map/screens/constants.dart';
import 'package:property_map/screens/print_sectors.dart';

class AllSectors extends StatefulWidget {
  static String id = 'AllSectors';

  @override
  State<StatefulWidget> createState() {
    return _AllSectorsState();
  }
}

class _AllSectorsState extends State<AllSectors> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: secondColor,
          title: Text('AllSectors'),
        ),
        body: DispalySectors(
          sectorList: sectorsList,
          columns: 2,
          margin: 20,
        ));
  }
}
