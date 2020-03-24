import 'package:flutter/material.dart';
import 'package:property_map/screens/sectormaps_page.dart';

class DispalySectors extends StatefulWidget {
  final List<String> sectorList;
  final int columns;
  final double gridHight;
  final double margin;
  const DispalySectors(
      {this.sectorList, this.columns, this.gridHight, this.margin});

  @override
  _DispalySectorsState createState() => _DispalySectorsState();
}

class _DispalySectorsState extends State<DispalySectors> {
  List data = [];

  @override
  void initState() {
    super.initState();
  }
  Widget _gallaryCard(int index) {
    return GestureDetector(
      onTap: () {
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Maps(
                          text: widget.sectorList[index],
                        )));
          });
      },
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage(
                  'images/menu_bg.png',
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Opacity(
                opacity: 0.2,
                child: Container(
                  color: Colors.black54,
                ),
              ),
            ),
            Center(
              child: Text(
                '${widget.sectorList[index]}',
                style: TextStyle(
                    fontSize: 20, color: Colors.white, fontFamily: 'OpenSans'),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: 20, vertical: widget.margin ?? 5),
          child: CustomScrollView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            slivers: <Widget>[
              SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return _gallaryCard(index);
                  }, childCount: widget.sectorList.length),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio:
                        widget.gridHight ?? 2.0, //mange height of columns
                    crossAxisCount: widget.columns, // provied columns numbers
                  )),
            ],
          )),
    );
  }
}
