import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_retail/firebase/auth_service.dart';
import 'package:gas_retail/login/login.dart';
import 'package:gas_retail/profile/change_password.dart';
import 'package:gas_retail/profile/edit_profile.dart';
import 'package:gas_retail/profile/rate_app.dart';

import '../login/login.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String name;
  String email;
  String profileUrl;

  bool isLogin = false;

  Map<String, dynamic> _profile;
  bool _loading = false;

  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User user) {
      print(user?.displayName);
      if (user != null) {
        isLogin = true;
        name = user?.displayName;
        email = user?.email;
        profileUrl = user?.photoURL;
      } else {
        isLogin = false;
        name = 'Guest';
        email = '--';
      }
    });
    authService.profile.listen((state) {
      setState(() {
        _profile = state;
      });
    });
    authService.loading.listen((state) => setState(() => _loading = state));
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User user){
      if (user != null) {
        setState(() {
          isLogin = true;
          name = user.displayName;
          email = user.email;
          profileUrl = user?.photoURL;
        });
      } else {
        setState(() {
          isLogin = false;
          name = 'Guest';
          email = '--';
        });
      }
    });
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                alignment: Alignment.centerLeft,
                color: Colors.white70,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    name == null ? 'No Name' : name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    email == null ? '--' : email,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
//====================================================================== My Account
              Container(
                child: InkWell(
                  onTap: () {
                    isLogin
                        ? setState(() => FirebaseAuth.instance.signOut().then((f) {
                              isLogin = false;
                              name = 'Guest';
                              email = '--';
                            }))
                        : Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                  },
                  child: Card(
                    child: ListTile(
                      leading: Image.asset(
                        isLogin
                            ? 'assets/images/log_out.png'
                            : 'assets/images/log_in.png',
                        width: 20,
                      ),
                      title: Text(
                        isLogin ? 'Log Out' : 'Log In',
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditProfilePage(),
                    ));
                  },
                  child: Card(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/edit_profile.png',
                        width: 20,
                      ),
                      title: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChangePasswordPage(),
                    ));
                  },
                  child: Card(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/change_password.png',
                        width: 20,
                      ),
                      title: Text(
                        'Change Password',
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RateAppPage(),
                    ));
                  },
                  child: Card(
                    child: ListTile(
                      leading: Image.asset(
                        'assets/images/rate_app.png',
                        width: 20,
                      ),
                      title: Text(
                        'Rate this app',
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
