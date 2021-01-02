import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../const.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ORDER NOW',
          style: Theme.of(context).textTheme.headline6,
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context, false);
            }),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //==============================Top Heading
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Order Checkout',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(
                            '3/3',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),

                      //============================== Order Details
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            //----------------------------- Brand
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Brand',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Image.asset(
                                    'assets/images/product-3.png',
                                    width: 50,
                                  ),
                                ],
                              ),
                            ),

                            //----------------------------- Size
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Size',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '12 KG',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),

                            //----------------------------- order type
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Order Type',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'Ksh. 80 Deposit',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),

                            //----------------------------- Quantity
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Quantity',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),

                            //----------------------------- Date & time
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Date & Time',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    DateFormat('yyyy-MM-dd HH:mm')
                                        .format(DateTime.now())
                                        .toString(),
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),

                            //----------------------------- name
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Name',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'User\'s fullName',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),

                            //----------------------------- Phone
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Phone Number',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '+254102756960',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),

                            //----------------------------- Email
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Email Address',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'kim@gmail.com',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),

                            //----------------------------- Residential Type
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Residential Type',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'Landed House / Property',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),

                            //----------------------------- Address
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Address',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'B-2-6 Green Avenue Eldoret 57000',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),

                            //----------------------------- Postcode
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Postcode',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '57000',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),

                            //----------------------------- Note
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Note',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    'A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog. A quick brown fox jumps over the lazy dog.',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //================================================================= Bottom Details
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black12,
                      ],
                      stops: [0.95, 5.0],
                    ),
                  ),
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Retail Price',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'RM 22.80',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Delivery & Service Charges',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Ksh. 6.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Total Price',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Ksh. 28.80',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 5,
                          bottom: 10,
                        ),
                        width: double.infinity,
                        alignment: Alignment.bottomRight,
                        child: CustomButton(
                          text: 'Next',
                          callback: () {
                            Navigator.pop(context, true);
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (context) => MyHomePage(),
//                              ),
//                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
