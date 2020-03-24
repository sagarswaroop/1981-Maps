import 'package:flutter/material.dart';
import 'package:property_map/screens/aboutus_page.dart';
import 'package:property_map/screens/allsector_page.dart';
import 'package:property_map/screens/compass.dart';
import 'package:property_map/screens/constants.dart';
import 'package:property_map/screens/contactus_page.dart';
import 'package:property_map/screens/home_page.dart';
import 'package:property_map/services/auth.dart';
import 'package:property_map/services/sharefeedback.dart';
import 'package:share/share.dart';

class Property extends StatefulWidget {
  static String id = 'Property';

  @override
  State<StatefulWidget> createState() {
    return _PropertyState();
  }
}

class _PropertyState extends State<Property> {
  AuthServices _auth = AuthServices();

  int _currentBottomNavIndex = 0;
  final String _eMail = 'Jaisairam173@gmail.com';

  Widget _callPage(int index) {
    print(index);
    switch (index) {
      case 0:
        return HomePage();
        break;
      case 1:
        return AboutUs();
        break;
      case 2:
        return ContactUs();
        break;
      default:
        return Property();
    }
    // return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage('images/header_bg.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Container(
                    child: Image(
                      image: AssetImage('images/ic_launcher_web.png'),
                    ),
                  )),
              InkWell(
                splashColor: Colors.deepOrange,
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                onTap: () {
                  setState(() {
                    _currentBottomNavIndex = 0;
                    Navigator.of(context).pop();
                  });
                },
              ),
              Divider(
                color: Colors.black38,
              ),
              InkWell(
                splashColor: Colors.deepOrange,
                child: ListTile(
                  leading: Icon(Icons.gps_fixed),
                  title: Text('Compass Navigation'),
                ),
                onTap: () {
                  setState(() {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Compass()));
                  });
                },
              ),
              InkWell(
                splashColor: Colors.deepOrange,
                child: ListTile(
                  leading: Icon(Icons.apps),
                  title: Text('All Sectors'),
                ),
                onTap: () {
                  setState(() {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AllSectors()));
                  });
                },
              ),
              InkWell(
                splashColor: Colors.deepOrange,
                child: ListTile(
                  leading: Icon(Icons.mail),
                  title: Text('Contact Us'),
                ),
                onTap: () {
                  setState(() {
                    _currentBottomNavIndex = 2;
                    Navigator.of(context).pop();
                  });
                },
              ),
              InkWell(
                splashColor: Colors.deepOrange,
                child: ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Share'),
                ),
                onTap: () {
                  // setState(() {
                    Share.share('1981 MAP APP http://play.google.com/store/apps/details?id=com.property_map');
                  // });
                },
              ),
              Divider(
                color: Colors.black38,
              ),
              InkWell(
                splashColor: Colors.deepOrange,
                child: ListTile(
                  leading: Icon(Icons.info),
                  title: Text('About Us'),
                ),
                onTap: () {
                  setState(() {
                    _currentBottomNavIndex = 1;
                    Navigator.of(context).pop();
                  });
                },
              ),
              InkWell(
                splashColor: Colors.deepOrange,
                child: ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text('Feedback and Suggestions'),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  MailServices.sendMail(_eMail);
                },
              ),
              InkWell(
                splashColor: Colors.deepOrange,
                child: ListTile(
                  leading: Icon(Icons.all_out),
                  title: Text('Logout'),
                ),
                onTap: () async {
                  Navigator.of(context).pop();
                  await _auth.signOut();
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: secondColor,
        title: Text(
          '1981 MAPS',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: _callPage(_currentBottomNavIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentBottomNavIndex = index;
          });
        },
        currentIndex: _currentBottomNavIndex,
        fixedColor: secondColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('About Us'),
            icon: Icon(Icons.info),
          ),
          BottomNavigationBarItem(
            title: Text('Contact Us'),
            icon: Icon(Icons.mail),
          )
        ],
      ),
    );
  }
}
