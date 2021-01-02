import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gas_retail/firebase/auth_service.dart';
import 'package:gas_retail/home/delivery_info.dart';

import '../const.dart';
import '../login/login.dart';
import '../signup/signup_page.dart';

class OrderNowPage extends StatefulWidget {
  String imgAsset;
  OrderNowPage({@required this.imgAsset});

  @override
  _OrderNowPageState createState() => _OrderNowPageState();
}

class _OrderNowPageState extends State<OrderNowPage> {
  bool newCustomer = false;
  bool existCustomer = false;
  bool kg12 = false;
  bool kg24 = false;
  int _quantity = 0;

  bool exitPage = false;

  @override
  void initState() {
    exitPage = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      exitPage ? Navigator.pop(context, true) : exitPage = false;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ORDER NOW',
          style: Theme.of(context).textTheme.headline6
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context, false);
            }),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //==============================Top Heading
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Order Now',
                          style: TextStyle(
                            fontSize: 30,
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
                //===================================================== Brand
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Brand',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 3,
                        child: Image.asset(
                          widget.imgAsset,
                          width: 150,
                        ),
                      ),
                    ],
                  ),
                ),

                //================================================ order type
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Order Type',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //======== New Customer =====
                      InkWell(
                        onTap: () {
                          setState(() {
                            existCustomer = false;
                            newCustomer = true;
                          });
                        },
                        child: Card(
                          color: newCustomer ? HexColor('#F5322B') : null,
                          elevation: 1,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'New: RM 80 Deposit',
                                  style: TextStyle(
                                      color: newCustomer ? Colors.white : null,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'For new customer only or any existing customer who need new gas tank',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: newCustomer
                                          ? Colors.white70
                                          : Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      //=============== Existing customer =========
                      InkWell(
                        onTap: () {
                          setState(() {
                            newCustomer = false;
                            existCustomer = true;
                          });
                        },
                        child: Card(
                          color: existCustomer ? HexColor('#F5322B') : null,
                          elevation: 1,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Existing',
                                  style: TextStyle(
                                      color:
                                          existCustomer ? Colors.white : null,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'For existing customers who have gas tank in their delivery address',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: existCustomer
                                          ? Colors.white70
                                          : Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //======================================================== Size
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Size',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        //===================== 12 KG ==============
                        InkWell(
                          onTap: () {
                            setState(() {
                              kg24 = false;
                              kg12 = true;
                            });
                          },
                          child: Card(
                            color: kg12 ? HexColor('#F5322B') : null,
                            elevation: 1,
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '12 KG',
                                    style: TextStyle(
                                        color: kg12 ? Colors.white : null,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'RM 22.80',
                                    style: TextStyle(
                                        color: kg12 ? Colors.white : null,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //=============== 24 Kg =========
                        InkWell(
                          onTap: () {
                            setState(() {
                              kg12 = false;
                              kg24 = true;
                            });
                          },
                          child: Card(
                            color: kg24 ? HexColor('#F5322B') : null,
                            elevation: 1,
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '24 KG',
                                    style: TextStyle(
                                        color: kg24 ? Colors.white : null,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'RM 26.60',
                                    style: TextStyle(
                                        color: kg24 ? Colors.white : null,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),

                //============================================================================ Bedrooms

                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Quantity',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        padding: EdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: 30,
                              margin: EdgeInsets.only(right: 10),
                              child: new FloatingActionButton(
                                heroTag: 'btn1',
                                onPressed: addQuantity,
                                child: new Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                                backgroundColor: Colors.white,
                              ),
                            ),
                            new Text('$_quantity',
                                style: new TextStyle(fontSize: 20.0)),
                            Container(
                              width: 30,
                              margin: EdgeInsets.only(left: 10),
                              child: new FloatingActionButton(
                                heroTag: 'btn2',
                                onPressed: minusQuantity,
                                child: new Icon(
                                  const IconData(0xe15b,
                                      fontFamily: 'MaterialIcons'),
                                  color: Colors.black,
                                ),
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //===================================================== Next Button
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    right: 10,
                    bottom: 20,
                  ),
                  width: double.infinity,
                  alignment: Alignment.bottomRight,
                  child: CustomButton(
                    text: 'Next',
                    callback: () {
                      if (newCustomer == false && existCustomer == false) {
                        messageAllert(
                            'Please select order type', 'Select Type');
                      } else if (kg24 == false && kg12 == false) {
                        messageAllert('Please select tank size', 'Select Size');
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DeliveryInfoPage(),
                            ));
                        authService.user != null ? null : loginAllert();
//                        Navigator.pop(context, true);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //============================================================================ Function Area

  void minusQuantity() {
    setState(() {
      if (_quantity != 0) _quantity--;
    });
  }

  void addQuantity() {
    setState(() {
      _quantity++;
    });
  }

  messageAllert(String msg, String ttl) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: Text(ttl),
            content: Text(msg),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Column(
                  children: <Widget>[
                    Text('Okay'),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  loginAllert() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: Text(
              'You need to login before proceed your order',
              style: TextStyle(fontSize: 14),
            ),
            content: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 5),
                  child: CustomButton(
                    text: 'LOGIN',
                    callback: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                  ),
                ),
                BorderButton(
                  text: 'SIGN UP',
                  callback: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        });
  }
}
