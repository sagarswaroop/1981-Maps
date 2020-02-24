import 'package:flutter/material.dart';
import 'package:property_map/cstmwidgets/customeloading.dart';
import 'package:property_map/cstmwidgets/main_head_line.dart';
import 'package:property_map/cstmwidgets/register_input_fileds.dart';
import 'package:property_map/services/auth.dart';
import 'package:toast/toast.dart';

class RegisterUser extends StatefulWidget {
  static String id = 'register_screen';
  final Function toggleScreen;

  RegisterUser({this.toggleScreen});

  @override
  State<StatefulWidget> createState() {
    return _RegisterUserSate();
  }
}

class _RegisterUserSate extends State<RegisterUser> {
  final AuthServices _auth = AuthServices();

  final bool autovalidate = true;
  final _formKey = GlobalKey<FormState>();
  final String _mailMsg = 'Please Enter a valid email Id';
  final String _blankFiledMsg = "Filed Can't be Emplty";
  bool loading = false;

  bool _showpassword = true;
  String _userContact;
  String _userEmail;
  String _userpwd;
  String _userName;

  void _showPasswordToggle() {
    _showpassword = !_showpassword;
  }

  void _validationSubmition() async {    
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      dynamic result = await _auth.registerEmailnPassword(_userEmail, _userpwd);
      if (result == null) {
        Toast.show('There is Some Error Try Again', context, duration: 2);
        loading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportconstraints) {
          return Scaffold(
            backgroundColor: Colors.black12,
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('images/home_bg.png'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              )),
              child: Form(
                  key: _formKey,
                  child: Container(
                      child: Center(
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 10),
                          child: AuthHeadlinText(
                            text: 'Register Form',
                            fontSize: 30,
                            textcolor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomRegisterInputField(
                            labelText: 'Name',
                            hintText: 'Enter Your Name',
                            keyboardType: TextInputType.text,
                            prefix: Icon(Icons.person),
                            validator: (name) {
                              if (name == '') {
                                return _blankFiledMsg;
                              } else if (name.length < 3) {
                                return "Please Enter full Name";
                              } else
                                return null;
                            },
                            onSaved: (name) {
                              _userName = name;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        CustomRegisterInputField(
                            labelText: 'Mobile Number',
                            hintText: 'Enter Your Mobile Number',
                            keyboardType: TextInputType.phone,
                            prefix: Icon(Icons.phone),
                            validator: (number) {
                              if (number == '') {
                                return _blankFiledMsg;
                              } else if (number.length < 10) {
                                return "Please Enter full Number";
                              }
                              return null;
                            },
                            onSaved: (no) => _userContact = no),
                        SizedBox(
                          height: 20,
                        ),
                        CustomRegisterInputField(
                          labelText: 'Email',
                          hintText: 'Enter Your Email Address',
                          keyboardType: TextInputType.emailAddress,
                          prefix: Icon(Icons.email),
                          validator: (String email) {
                            if (email == '') {
                              return _blankFiledMsg;
                            } else if (!email.contains('.com')) {
                              return _mailMsg;
                            } else {
                              return email.contains('@') ? null : _mailMsg;
                            }
                          },
                          onSaved: (email) => _userEmail = email,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomRegisterInputField(
                          obscureText: _showpassword,
                          labelText: 'Password',
                          hintText: 'Enter Your Passwrod',
                          keyboardType: TextInputType.text,
                          prefix: Icon(
                            Icons.lock,
                          ),
                          suffix: GestureDetector(
                            onTap: () {
                              setState(() {
                                _showPasswordToggle();
                              });
                            },
                            child: _showpassword
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(right: 10.0, top: 2.0),
                                    child: Icon(Icons.visibility_off))
                                : Padding(
                                    padding:
                                        EdgeInsets.only(right: 10.0, top: 2.0),
                                    child: Icon(Icons.visibility)),
                          ),
                          validator: (String password) {
                            if (password == '') {
                              return _blankFiledMsg;
                            } else {
                              return password.length < 4
                                  ? "Password must be atleast four character "
                                  : null;
                            }
                          },
                          onSaved: (pwd) => _userpwd = pwd,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 80, right: 80),
                          child: SizedBox(
                            width: 10,
                            height: 40,
                            child: Divider(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 50, right: 50, bottom: 10),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 5, left: 50, right: 50),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              child: Text('Register'),
                              onPressed: () {
                                _validationSubmition();
                              },
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'if, Already Registerd',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: FlatButton(
                            child: Text('Login Here',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue,
                                    fontSize: 20)),
                            onPressed: () {
                              widget.toggleScreen();
                            },
                          ),
                        )
                      ],
                    ),
                  ))),
            ),
          );
        },
      ),
    );
  }
}
