import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './order_now.dart';
import '../const.dart';

class HomeTabe extends StatefulWidget {
  @override
  _HomeTabeState createState() => _HomeTabeState();
}

class _HomeTabeState extends State<HomeTabe> {
  bool mira = false;
  bool petron = false;
  bool gasPetron = false;
  bool solarGas = false;
  bool bhPetrol = false;
  bool myGas = false;

  String companyImage;

  bool exitPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                'Order Now',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Column(
                children: <Widget>[
                  //======================== first row
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              mira = true;
                              companyImage = 'assets/images/product-1.png';
                              petron = false;
                              gasPetron = false;
                              solarGas = false;
                              bhPetrol = false;
                              myGas = false;
                            });
                          },
                          splashColor: Theme.of(context).primaryColor,
                          child: Container(
                            decoration: mira
                                ? BoxDecoration(
                                    border: Border.all(color: Colors.red))
                                : null,
                            child: Card(
                              borderOnForeground: mira,
                              elevation: 3,
                              child: Image.asset(
                                'assets/images/product-1.png',
                                width: 150,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              mira = false;
                              petron = true;
                              companyImage = 'assets/images/product-2.png';
                              gasPetron = false;
                              solarGas = false;
                              bhPetrol = false;
                              myGas = false;
                            });
                          },
                          splashColor: Theme.of(context).primaryColor,
                          child: Container(
                            decoration: petron
                                ? BoxDecoration(
                                    border: Border.all(color: Colors.red))
                                : null,
                            child: Card(
                              elevation: 3,
                              child: Image.asset(
                                'assets/images/product-2.png',
                                width: 150,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //=================== second row
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              mira = false;
                              petron = false;
                              gasPetron = true;
                              companyImage = 'assets/images/product-3.png';
                              solarGas = false;
                              bhPetrol = false;
                              myGas = false;
                            });
                          },
                          splashColor: Theme.of(context).primaryColor,
                          child: Container(
                            decoration: gasPetron
                                ? BoxDecoration(
                                    border: Border.all(color: Colors.red))
                                : null,
                            child: Card(
                              elevation: 3,
                              child: Image.asset(
                                'assets/images/product-3.png',
                                width: 150,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              mira = false;
                              petron = false;
                              gasPetron = false;
                              solarGas = true;
                              companyImage = 'assets/images/product-4.png';
                              bhPetrol = false;
                              myGas = false;
                            });
                          },
                          splashColor: Theme.of(context).primaryColor,
                          child: Container(
                            decoration: solarGas
                                ? BoxDecoration(
                                    border: Border.all(color: Colors.red))
                                : null,
                            child: Card(
                              elevation: 3,
                              child: Image.asset(
                                'assets/images/product-4.png',
                                width: 150,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //=================== third row
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              mira = false;
                              petron = false;
                              gasPetron = false;
                              solarGas = false;
                              bhPetrol = true;
                              companyImage = 'assets/images/product-5.png';
                              myGas = false;
                            });
                          },
                          splashColor: Theme.of(context).primaryColor,
                          child: Container(
                            decoration: bhPetrol
                                ? BoxDecoration(
                                    border: Border.all(color: Colors.red))
                                : null,
                            child: Card(
                              elevation: 3,
                              child: Image.asset(
                                'assets/images/product-5.png',
                                width: 150,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              mira = false;
                              petron = false;
                              gasPetron = false;
                              solarGas = false;
                              bhPetrol = false;
                              myGas = true;
                              companyImage = 'assets/images/product-6.png';
                            });
                          },
                          splashColor: Theme.of(context).primaryColor,
                          child: Container(
                            decoration: myGas
                                ? BoxDecoration(
                                    border: Border.all(color: Colors.red))
                                : null,
                            child: Card(
                              elevation: 3,
                              child: Image.asset(
                                'assets/images/product-6.png',
                                width: 150,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
                right: 20,
              ),
              width: double.infinity,
              alignment: Alignment.bottomRight,
              child: CustomButton(
                text: 'Next',
                callback: () async {
                  if (companyImage == null) {
                    messageAllert('Please select a brand to proceed', 'Brand');
                  } else {
                    exitPage = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderNowPage(
                            imgAsset: companyImage,
                          ),
                        ));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  //=============================================== Function Area

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
}
