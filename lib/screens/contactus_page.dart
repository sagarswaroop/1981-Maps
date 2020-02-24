import 'package:flutter/material.dart';
import 'package:property_map/screens/constants.dart';

class ContactUs extends StatelessWidget {
  static String id = 'contact_us';

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
      child: ListView(
      children: <Widget>[
        Container(
            child: Image(
          image: AssetImage('images/contactus.png'),
        )),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Contact Us',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 500,
                height: 5,
                child: Divider(
                  color: Colors.grey,
                  height: 5,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text('For Any Query Contact Here',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 23)),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 0.2),
                child: Text('Contact Number',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2),
                child: Text('(+91)8882359285',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 0.2),
                child: Text('E-mail Adrress',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 2),
                child: Text('Jaisairam173@gmail.com',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ],
    ),
    );

    
  }
}
