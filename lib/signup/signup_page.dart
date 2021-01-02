import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gas_retail/const.dart';
import 'package:gas_retail/signup/pin_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool confirmPassVisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool passwordVisible = true;

  String _confirmPass;
  String _email;
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    passwordVisible = true;
    confirmPassVisible = true;
    super.initState();
  }

  void submit() async {
    UserCredential result;
    try {
      result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passController.text);
      print(result);
    } on PlatformException catch (error) {
      var message = "You are not connected to internet";
      if (error.message != null) {
        message = error.message;
      }
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(message.toString()),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
    } catch (e) {
      print(e);
    }
    FirebaseFirestore
    .instance
    .collection('User')
    .doc(result.user.uid)
    .set({
      "Username": nameController.text,
      "UserId": result.user.uid,
      "Email": emailController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Account Registeration',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        '1/3',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),

                //==================================== From Starts here
                Container(
                  padding: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //============================================= Name Box
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: TextFormField(
                              onChanged: ((String name) {
                                setState(() {
                                  _name = name;
                                  print(_name);
                                });
                              }),
                              controller: nameController,
                              decoration: InputDecoration(
                                labelText: "Name",
                                labelStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              textAlign: TextAlign.start,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                          ),
                          //============================================= Email Box
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: TextFormField(
                              onChanged: ((String email) {
                                setState(() {
                                  _email = email;
                                  print(_email);
                                });
                              }),
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: "Email Address",
                                labelStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              textAlign: TextAlign.start,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your email address';
                                }
                                return null;
                              },
                            ),
                          ),

                          //============================================= Password Box
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: TextFormField(
                              obscureText: passwordVisible,
                              onChanged: ((String pass) {
                                setState(() {
                                  _password = pass;
                                  print(_password);
                                });
                              }),
                              controller: passController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: "Password",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    passwordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black54,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              textAlign: TextAlign.start,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter password';
                                }
                                return null;
                              },
                            ),
                          ),

                          //============================================= Password Box
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: TextFormField(
                              obscureText: confirmPassVisible,
                              onChanged: ((String pass) {
                                setState(() {
                                  _confirmPass = pass;
                                  print(_confirmPass);
                                });
                              }),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: "Confirm Password",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    confirmPassVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black54,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      confirmPassVisible = !confirmPassVisible;
                                    });
                                  },
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.black54,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              textAlign: TextAlign.start,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter confirm password';
                                }
                                return null;
                              },
                            ),
                          ),
                        ]),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 150, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        child: Row(
                          children: <Widget>[
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Theme.of(context).primaryColor,
                                )),
                            Text(
                              'GO BACK',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      CustomButton(
                        text: 'NEXT',
                        callback: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pop(context);
                            submit();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PinPage(
                                  email: _email,
                                ),
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
