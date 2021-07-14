import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:medico/pages/Home.dart';
//import 'package:medico/pages/questionairescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:group_radio_button/group_radio_button.dart';

class Foa extends StatefulWidget {
  @override
  _FoaState createState() => _FoaState();
}

class _FoaState extends State<Foa> {
  int i = 0;

  String button = 'Next';
  List<double> _choiceValue = [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4];

  String _verticalGroupValue = '';

  List<String> _status = [
    'completely untrue of me',
    'mostly untrue of me',
    'slightly more true than untrue of me.',
    'moderately true of me',
    ' mostly true of me',
    'describes me perfectly'
  ];

  List questions = [
    ' 1. I worry a lot that the people I love will die or leave me.',
    ' 2. I cling to people because I am afraid they will leave me.',
    ' 3. I do not have a stable base of support.',
    ' 4. I keep falling in love with people who cannot be there for me in a committed way.',
    ' 5. People have always come and gone in my life.',
    ' 6. I get desperate when someone I love pulls away.',
    ' 7. I get so obsessed with the idea that my lovers will leave me that I drive them away.',
    ' 8. The people closest to me are unpredictable. One minute they are there for me and the next minute they are gone.',
    ' 9. I need other people too much.',
    ' 10. In the end I will be alone.'
  ];
  Future<bool> addfoascore(double v) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    var email = prefs.getString('email');
    double score = v;
    print("Name:$v");
    await _db
        .collection('Users')
        .doc(email)
        .collection('assesments')
        .doc('foa')
        .set({'score': score});
    SharedPreferences sprefs = await SharedPreferences.getInstance();
    prefs.setDouble('foa', score);
    return true;
  }

  double _foascore(List values) {
    double sum = 0;

    for (int i = 0; i <= 9; i++) {
      sum = sum + values[i];
    }

    return sum;
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    /* Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );*/

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
                height: 450,
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
                      height: 120,
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

                            if (_verticalGroupValue ==
                                'completely untrue of me') {
                              _choiceValue[i] = 1.0;
                            } else if (_verticalGroupValue ==
                                'mostly untrue of me') {
                              _choiceValue[i] = 2.0;
                            } else if (_verticalGroupValue ==
                                'slightly more true than untrue of me.') {
                              _choiceValue[i] = 3.0;
                            } else if (_verticalGroupValue ==
                                'moderately true of me') {
                              _choiceValue[i] = 4.0;
                            }
                            if (_verticalGroupValue == ' mostly true of me') {
                              _choiceValue[i] = 5.0;
                            } else if (_verticalGroupValue ==
                                'describes me perfectly') {
                              _choiceValue[i] = 6.0;
                            }
                          }),
                          items: _status,
                          itemBuilder: (item) => RadioButtonBuilder(
                            item,
                          ),
                        ),
                      ]),
                    ),
                    Padding(padding: EdgeInsets.only(top: 50)),
                    TextButton(
                        onPressed: () {
                          if (_verticalGroupValue.isEmpty) {
                            i--;
                            showAlertDialog(context);
                          }
                          print(_choiceValue);
                          if (i == 9) {
                            addfoascore(_foascore(_choiceValue));
                            Navigator.of(context, rootNavigator: true).pop();
                            /*  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Questioanires()),
                            );*/
                          }
                          setState(() {
                            if (i == questions.length - 1) {
                              button = 'Finish';
                            } else {
                              _verticalGroupValue = '';
                              print(i);
                              i += 1;
                            }
                          });
                        },
                        child: Text(button,
                            style: TextStyle(
                              fontFamily: 'Lato-Bold',
                              color: Colors.blue[900],
                            )))
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
