import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medico/models/user.dart';

class CreateAcount extends StatefulWidget {
  @override
  _CreateAcountState createState() => _CreateAcountState();
}

class _CreateAcountState extends State<CreateAcount> {
  var _fullNameController = new TextEditingController();
  var _phoneNumberController = new TextEditingController();
  User currentUser = new User.init().getCurrentUser();

  final _fbKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/home',
                arguments: [currentUser.name, currentUser.phoneNumber]);
          },
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
        ),
        title: Text(
          "Create An Acount",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: double.maxFinite,
          color: Theme.of(context).primaryColor,
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: <Widget>[
                      Form(
                        key: _fbKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              margin: const EdgeInsets.only(top: 12.0),
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.grey.withOpacity(0.4)),
                              child: TextFormField(
                                controller: _fullNameController,
                                initialValue: 'raoufsmari', //for testing
                                decoration: InputDecoration(
                                  hintText: "Full Name",
                                  hintStyle: TextStyle(fontFamily: 'Poppins'),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              height: 50.0,
                              margin: const EdgeInsets.only(top: 12.0),
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.grey.withOpacity(0.4)),
                              child: TextFormField(
                                initialValue: '213796113384', //for testing
                                controller: _phoneNumberController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(fontFamily: 'Poppins'),
                                  prefixText: "+",
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Container(
                              height: 50.0,
                              margin: const EdgeInsets.only(top: 12.0),
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.grey.withOpacity(0.4)),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Birth Day",
                                    hintStyle:
                                        TextStyle(fontFamily: 'Poppins')),
                              ),
                            ),
                            Container(
                              height: 50.0,
                              margin: const EdgeInsets.only(top: 12.0),
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.grey.withOpacity(0.4)),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Gender",
                                    hintStyle:
                                        TextStyle(fontFamily: 'Poppins')),
                                initialValue: 'Male',
                              ),
                            ),
                            Container(
                              height: 50.0,
                              margin: const EdgeInsets.only(top: 12.0),
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.grey.withOpacity(0.4)),
                              child: TextFormField(
                                initialValue: '25', //for testing
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Weight",
                                    hintStyle: TextStyle(fontFamily: 'Poppins'),
                                    suffixText: 'KG'),
                              ),
                            ),
                            Container(
                              height: 50.0,
                              margin: const EdgeInsets.only(top: 12.0),
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.grey.withOpacity(0.4)),
                              child: TextFormField(
                                initialValue: '62', //for testing
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Height",
                                    hintStyle: TextStyle(fontFamily: 'Poppins'),
                                    suffixText: 'CM'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MaterialButton(
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      fontFamily: "Poppins"),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/home', arguments: [
                    _fullNameController.text,
                    _phoneNumberController.text.toString()
                  ]);
                },
              ),
              MaterialButton(
                child: Text(
                  "Reset",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      fontFamily: "Poppins"),
                ),
                onPressed: () {
                  _fbKey.currentState.reset();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
