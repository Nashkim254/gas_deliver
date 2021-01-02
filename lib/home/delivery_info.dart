import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_retail/home/check_out.dart';

import '../const.dart';

class DeliveryInfoPage extends StatefulWidget {
  @override
  _DeliveryInfoPageState createState() => _DeliveryInfoPageState();
}

class _DeliveryInfoPageState extends State<DeliveryInfoPage> {
  @override
  String _name;

  String radioItem = 'Landed House / Property';
  int id = 0;

  List<ResidentialList> fList = [
    ResidentialList(
      index: 0,
      name: "Landed House / Property",
    ),
    ResidentialList(
      index: 1,
      name: "Condominium Apartment / High Rise Building",
    ),
    ResidentialList(
      index: 2,
      name: "Comercial",
    ),
  ];

  final _formKey = GlobalKey<FormState>();

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //==============================Top Heading
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Delivery Information',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(
                                    '2/3',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          '*Please take note: Additional changes due to more time consuming and long waiting time. '
                                          'Building that without elevator might have other additional charges, please consult assigned delivery driver.',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200),
                                        ),
                                      ),
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
                                          decoration: InputDecoration(
                                            labelText: "Name",
                                            labelStyle: TextStyle(
                                              color: Colors.black54,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          textAlign: TextAlign.start,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter full name';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),

                                      //============================================= Phone Box
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          onChanged: ((String name) {
                                            setState(() {
                                              _name = name;
                                              print(_name);
                                            });
                                          }),
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            labelText: "Phone",
                                            labelStyle: TextStyle(
                                              color: Colors.black54,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          textAlign: TextAlign.start,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter phone number';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),

                                      //============================================= Email Box
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          onChanged: ((String name) {
                                            setState(() {
                                              _name = name;
                                              print(_name);
                                            });
                                          }),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            labelText: "Email",
                                            labelStyle: TextStyle(
                                              color: Colors.black54,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          textAlign: TextAlign.start,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter email address';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),

                                      //========================================= Residential Type
                                      Container(
                                        margin: EdgeInsets.only(top: 20),
                                        child: Text(
                                          'Residential Type',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        child: Column(
                                          children: fList
                                              .map(
                                                (data) => ListTile(
                                                  title: Text('${data.name}',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 16)),
                                                  trailing: Radio(
                                                    value: data.index,
                                                    activeColor:
                                                        Colors.green[400],
                                                    groupValue: id,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        radioItem = data.name;
                                                        id = data.index;
                                                        print(radioItem);
                                                        print(id);
                                                      });
                                                    },
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),

                                      //========================================= Delivery Address

                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          maxLines: 5,
                                          onChanged: ((String name) {
                                            setState(() {
                                              _name = name;
                                              print(_name);
                                            });
                                          }),
                                          decoration: InputDecoration(
                                            labelText: "Delivery Address",
                                            labelStyle: TextStyle(
                                              color: Colors.black54,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          textAlign: TextAlign.start,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter delivery address';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),

                                      //============================================= Post code box
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: TextFormField(
                                          onChanged: ((String name) {
                                            setState(() {
                                              _name = name;
                                              print(_name);
                                            });
                                          }),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            labelText: "Postcode",
                                            labelStyle: TextStyle(
                                              color: Colors.black54,
                                            ),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          textAlign: TextAlign.start,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter postcode';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ]),
                              ),
                            ),

                            //========================================= Notes

                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: TextFormField(
                                maxLines: 5,
                                onChanged: ((String name) {
                                  setState(() {
                                    _name = name;
                                    print(_name);
                                  });
                                }),
                                decoration: InputDecoration(
                                  labelText: "Note",
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
                                    return 'Please enter a detailed note about your order';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            //============================================== Form finish here...
                          ]),
                    ],
                  ),
                ),
              ),
            ),
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
                            'Ksh. 22.80',
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
                          callback: () async {
//                            if (_formKey.currentState.validate()) {
                            exitPage = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckOutPage(),
                              ),
                            );
//                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//============================================================= Function Area

}

//---------------------------------------- Class
class ResidentialList {
  String name;
  int index;
  ResidentialList({this.name, this.index});
}
