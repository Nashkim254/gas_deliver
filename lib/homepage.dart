import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gas_retail/const.dart';
import 'package:gas_retail/history/filter_page.dart';
import 'package:gas_retail/history/history_tab.dart';
import 'package:gas_retail/home/home_tab.dart';
import 'package:gas_retail/notification/notification_tab.dart';
import 'package:gas_retail/profile/profile_tab.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentTabIndex = 0;
  String titleApp = 'HOME';
  String userId = '';
  List<Widget> tabs = [
    HomeTabe(),
    HistoryTab(),
    NotificationTab(),
    ProfileTab(),
  ];
//on tap tabs
  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
      if (currentTabIndex == 0) {
        titleApp = 'HOME';
      } else if (currentTabIndex == 1) {
        titleApp = 'HISTORY';
      } else if (currentTabIndex == 2) {
        titleApp = 'NOTIFICATIONS';
      } else if (currentTabIndex == 3) {
        titleApp = 'PROFILE';
      } else {
        titleApp = 'MY GAS';
      }
    });
  }

  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = AppBar(
      title: Text(
        titleApp,
        style: Theme.of(context).textTheme.headline6,
      ),
      automaticallyImplyLeading: false,
    );

    final PreferredSizeWidget jobAppBar = AppBar(
      title: Text(
        titleApp,
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.tune,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
            }),
      ],
      automaticallyImplyLeading: false,
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: currentTabIndex == 1 ? jobAppBar : appBar,
      body: WillPopScope(child: tabs[currentTabIndex], onWillPop: onWillPop),
//      body: tabs[currentTabIndex],
      endDrawer: currentTabIndex == 1 ? FilterPage() : null,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        onTap: onTapped,
        selectedItemColor: HexColor('#F5322B'),
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        currentIndex: currentTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('History'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_active,
            ),
            title: Text('Notification'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }

  DateTime currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 1)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Doube press back to exit');
      return Future.value(false);
    }
    return Future.value(true);
  }
}
