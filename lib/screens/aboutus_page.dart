import 'package:flutter/material.dart';
import 'package:property_map/screens/constants.dart';

class AboutUs extends StatelessWidget {
  static String id = 'Aboutus_screen';

  @override
  Widget build(BuildContext context) {
    return Container(
        
        decoration: BoxDecoration(

          gradient: LinearGradient(
          colors: <Color>[Colors.orangeAccent, secondColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
          )
        ),
        child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              child: Image(
            fit: BoxFit.cover,
            image: AssetImage('images/ic_launcher_web.png'),
          )),
          Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                'About Us',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: 'OpenSans',fontWeight: FontWeight.bold),
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 60),
            child: SizedBox(height: 15,width: 200,
            child: Divider(color: Colors.black54,),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              ' 1981 maps is a initiative to guide all the individuals about the property listed in area and help the individulas to check the exact maps of the location, which can help them to see the property. Secondaly person can use compass to check their exact navigation and direction. We are just a step away to help you',
              style: TextStyle(fontSize: 20,),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
