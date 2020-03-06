// import 'package:flutter/material.dart';
// import 'package:property_map/cstmwidgets/customeloading.dart';
// import 'package:property_map/cstmwidgets/main_head_line.dart';
// import 'package:property_map/cstmwidgets/register_input_fileds.dart';
// import 'package:property_map/services/auth.dart';
// import 'package:toast/toast.dart';

// class LoginScreen extends StatefulWidget {
//   static String id = 'login_Screen';
//   final Function screen;

//   LoginScreen({this.screen});

//   @override
//   State<StatefulWidget> createState() {
//     return _LoginScreenState();
//   }
// }

// class _LoginScreenState extends State<LoginScreen> {
//   AuthServices _auth = AuthServices();

//   bool _showpassword = true;

//   final _formKey = GlobalKey<FormState>();
//   final String _blankFiledMsg = "Filed Can't be Emplty";
//   bool loading = false;

//   String _userContact;

//   void _submit() async {
//     loading = true;
//     var form = _formKey.currentState;
//     if (form.validate()) {
//       form.save();
//       print('$_userEmail and $_userpwd');

//       dynamic result = await _auth.signInEmailnPassword(_userEmail, _userpwd);
//       print("result is $result");
//       if (result == null) {
//         setState(() {
//           Toast.show('wrong email or password', context, duration: 2);
//         loading = false;
//         });
        
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return loading
//         ? Loading()
//         : SafeArea(
//             child: LayoutBuilder(
//               builder:
//                   (BuildContext context, BoxConstraints viewportconstraints) {
//                 return Scaffold(
//                   resizeToAvoidBottomPadding: false,
//                   backgroundColor: Colors.black12,
//                   body: Container(
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage('images/home_bg.png'),
//                               fit: BoxFit.cover,
//                               alignment: Alignment.topCenter,
//                               repeat: ImageRepeat.noRepeat)),
//                       child: Form(
//                         key: _formKey,
//                         child: Stack(
//                           fit: StackFit.expand,
//                           children: <Widget>[
//                             SingleChildScrollView(
//                               child: ConstrainedBox(
//                                 constraints: viewportconstraints,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           top: 40, bottom: 10),
//                                       child: AuthHeadlinText(
//                                         text: 'User Login',
//                                         fontSize: 30,
//                                         textcolor: Colors.white,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: <Widget>[
//                                         CustomRegisterInputField(
//                                   labelText: 'Mobile Number',
//                                   hintText: 'Enter Your Mobile Number',
//                                   keyboardType: TextInputType.phone,
//                                   prefix: Icon(Icons.phone),
//                                   validator: (number) {
//                                     if (number == '') {
//                                       return _blankFiledMsg;
//                                     } else if (number.length < 10) {
//                                       return "Please Enter a valid Number";
//                                     }
//                                     return null;
//                                   },
//                                   onSaved: (no) => _userContact = ('+91' + no)),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       width: 200,
//                                       height: 40,
//                                       child: Divider(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(bottom: 5),
//                                       child: RaisedButton(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                         ),
//                                         color: Colors.white,
//                                         child: Text('Login'),
//                                         onPressed: () {
//                                           setState(() {
//                                             _submit();
//                                           });
//                                         },
//                                       ),
//                                     ),
//                                     Text(
//                                       'or',
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 10),
//                                     ),
//                                     GestureDetector(
//                                         child: Text("Register Here",
//                                             style: TextStyle(
//                                                 decoration:
//                                                     TextDecoration.underline,
//                                                 color: Colors.blue,
//                                                 fontSize: 20)),
//                                         onTap: () {
//                                           widget.screen();
//                                         }),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )),
//                 );
//               },
//             ),
//           );
//   }
// }
