import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:medico/pages/Home.dart';
import 'package:medico/pages/questionairescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:group_radio_button/group_radio_button.dart';

class Bmis extends StatefulWidget {
  @override
  _BmisState createState() => _BmisState();
}

class _BmisState extends State<Bmis> {
  int i = 0;

  String button = 'Next';
  List<double> _choiceValue = [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4];

  String _verticalGroupValue = '';

  List<String> _status = [
    '(definitely do not feel)',
    '(do not feel)',
    '(slightly feel)',
    '(definitely feel)'
  ];

  List questions = [
    'Lively',
    'Happy',
    'Sad',
    'Tired',
    'Caring',
    'Content',
    'Gloomy',
    'Jittery',
    'Drowsy',
    'Grouchy',
    'Peppy',
    'Nervous',
    'Calm',
    'Loving',
    'Fed up',
    'Active'
  ];
  Future<bool> addbmisscore(double v) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    var email = prefs.getString('email');
    double score = v;
    print("Name:$v");
    await _db
        .collection('Users')
        .doc(email)
        .collection('bmis')
        .doc()
        .set({'score': score});
    return true;
  }

  double _bmisscore(List values) {
    double sum = 0;

    for (int i = 0; i <= 15; i++) {
      sum = sum + values[i];
    }

    return sum;
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    /*  Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );
*/
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("Please Select a Choice."),
      actions: [],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Center(
              child: Container(
                height: 400,
                width: 350,
                margin: EdgeInsets.only(top: 100),
                padding:
                    EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 5,
                      blurRadius: 20,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.97,
                      height: 150,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0)),
                        color: Theme.of(context).accentColor,
                      ),
                      child: Center(
                        child: Text(questions[i].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Lato-Bold',
                              fontSize: 16,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    Container(
                      child: Column(children: [
                        RadioGroup<String>.builder(
                          groupValue: _verticalGroupValue,
                          onChanged: (value) => setState(() {
                            _verticalGroupValue = value;
                            print(value);
                            if (questions[i] == "Active" ||
                                questions[i] == "Calm" ||
                                questions[i] == "Caring" ||
                                questions[i] == "Content" ||
                                questions[i] == "Happy" ||
                                questions[i] == "Lively" ||
                                questions[i] == "Loving" ||
                                questions[i] == "Peppy") {
                              if (_verticalGroupValue ==
                                  '(definitely do not feel)') {
                                _choiceValue[i] = 1.0;
                              } else if (_verticalGroupValue ==
                                  '(do not feel)') {
                                _choiceValue[i] = 2.0;
                              } else if (_verticalGroupValue ==
                                  '(slightly feel)') {
                                _choiceValue[i] = 3.0;
                              } else if (_verticalGroupValue ==
                                  '(definitely feel)') {
                                _choiceValue[i] = 4.0;
                              }
                            } else if (questions[i] == "Drowsy" ||
                                questions[i] == "Gloomy" ||
                                questions[i] == "Fed up" ||
                                questions[i] == "Grouchy" ||
                                questions[i] == "Jittery" ||
                                questions[i] == "Nervous" ||
                                questions[i] == "Sad" ||
                                questions[i] == "Tired") {
                              if (_verticalGroupValue ==
                                  '(definitely do not feel)') {
                                _choiceValue[i] = 4.0;
                              } else if (_verticalGroupValue ==
                                  '(do not feel)') {
                                _choiceValue[i] = 3.0;
                              } else if (_verticalGroupValue ==
                                  '(slightly feel)') {
                                _choiceValue[i] = 2.0;
                              } else if (_verticalGroupValue ==
                                  '(definitely feel)') {
                                _choiceValue[i] = 1.0;
                              }
                            }
                          }),
                          items: _status,
                          itemBuilder: (item) => RadioButtonBuilder(
                            item,
                          ),
                        ),
                      ]),
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    TextButton(
                        onPressed: () {
                          if (_verticalGroupValue.isEmpty) {
                            i--;
                            showAlertDialog(context);
                          }
                          print(_choiceValue);
                          if (i == 15) {
                            addbmisscore(_bmisscore(_choiceValue));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Questioanires()),
                            );
                          }
                          setState(() {
                            if (i == 14) {
                              button = 'Finish';
                            }
                            _verticalGroupValue = '';
                            print(i);
                            i += 1;
                          });
                        },
                        child: Text(button))
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
