import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gas_retail/const.dart';
import 'package:gas_retail/home/home_tab.dart';
import 'package:gas_retail/homepage.dart';
import 'package:gas_retail/login/login.dart';
import 'package:gas_retail/splash.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Gas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: HexColor('#F5322B'),
        primarySwatch: Colors.red,
//        primaryColor: Colors.red,
        accentColor: Colors.blue,
//        fontFamily: 'Roboto',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
//                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
              button: TextStyle(
                color: Colors.white,
              ),
            ),
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MyHomePage();
            } else {
              return LoginPage();
            }
          },
        ), 
    );
  }
}

