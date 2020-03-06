import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:property_map/cstmwidgets/customeloading.dart';
import 'package:property_map/cstmwidgets/register_input_fileds.dart';
import 'package:property_map/services/auth.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  String _userContact;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    checkInternetConnectivity();
  }

  checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.none) {
      Toast.show("No internet Connection", context, duration: 3);
    } else if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      Toast.show("Network Access Successfully", context, duration: 3);
    }
  }

  void _validationSubmition(BuildContext context) async {
    var form = _formKey.currentState;
    if (form.validate()) {
      checkInternetConnectivity();
      _auth.verifyPhone(_userContact, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.black12,
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('images/home_bg.png'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              )),
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Center(
                      child: Form(
                        key: _formKey,
                        child: _getFormUI(),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }

  Widget _getFormUI() {
    return Column(
      children: <Widget>[
        Image.asset("images/ic_launcher_web.png", height: 200, width: 200),
        SizedBox(
          height: 20.0,
        ),
        CustomRegisterInputField(
            labelText: 'Mobile Number',
            hintText: 'Enter Your Mobile Number',
            keyboardType: TextInputType.phone,
            prefix: Icon(Icons.phone),
            validator: (number) {
              if (number == '') {
                return "Filed Can't be Emplty";
              } else if (number.length < 10) {
                return "Please Enter a valid Number";
              }
              return null;
            },
            onSaved: (no) => _userContact = ('+91' + no)),
        Container(
          margin: EdgeInsets.only(left: 80, right: 80),
          child: SizedBox(
            height: 40,
            child: Divider(
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 50, right: 50, bottom: 10),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.blueAccent,
              child: Text('Verify Yourself'),
              onPressed: () {
                _validationSubmition(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
