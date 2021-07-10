import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:medico/pages/Home.dart';
//import 'package:medico/pages/questionairescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Erq extends StatefulWidget {
  @override
  _ErqState createState() => _ErqState();
}

class _ErqState extends State<Erq> {
  String _sliderValuet;
  int i = 0;
  String button = 'Next';
  List<double> _sliderValue = [4, 4, 4, 4, 4, 4, 4, 4, 4, 4];
  List questions = [
    '1. ____ When I want to feel more positive emotion (such as joy or amusement), I change what I’m thinking about. ',
    '2. ____ I keep my emotions to myself.',
    '3. ____ When I want to feel less negative emotion (such as sadness or anger), I change what I’m thinking about. ',
    '4. ____When I am feeling positive emotions, I am careful not to express them. ',
    '5. ____When I’m faced with a stressful situation, I make myself think about it in a way that helps me stay calm. ',
    '6. ____ I control my emotions by not expressing them. ',
    '7. ____When I want to feel more positive emotion, I change the way I’m thinking about the situation.',
    '8. ____ I control my emotions by changing the way I think about the situation I’m in. ',
    '9. ____When I am feeling negative emotions, I make sure not to express them.',
    '10. ____When I want to feel less negative emotion, I change the way I’m thinking about the situation.'
  ];
  Future<bool> adderqscore(double v) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final FirebaseFirestore _db = FirebaseFirestore.instance;
    var email = prefs.getString('email');
    double score = v;
    print("Name:$v");
    await _db
        .collection('Users')
        .doc(email)
        .collection('erq')
        .doc()
        .set({'score': score});
    return true;
  }

  double _erqscore(List values) {
    double avg;
    double sum = 0;

    for (int i = 0; i <= questions.length; i++) {
      sum = sum + values[i];
    }
    avg = (sum / values.length);
    return avg;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Center(
              child: Container(
                height: 350,
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
                  color: Theme.of(context).accentColor,
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
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(questions[i].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Lato-Bold',
                              fontSize: 16,
                              color: Colors.blue[900],
                            )),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 70)),
                    Container(
                      child: Slider(
                        activeColor: Colors.white,
                        value: _sliderValue[i],
                        min: 1,
                        max: 7,
                        divisions: 6,
                        label: _sliderValuet,
                        onChanged: (value) {
                          setState(() {
                            if (_sliderValue[i] == 1) {
                              _sliderValue[i] = value;
                              _sliderValuet = 'Strongly Disagree';
                            } else if (_sliderValue[i] == 7) {
                              _sliderValue[i] = value;
                              _sliderValuet = 'Strongly Agree';
                            } else if (_sliderValue[i] == 4) {
                              _sliderValue[i] = value;
                              _sliderValuet = 'Neutral';
                            } else {
                              _sliderValue[i] = value;

                              _sliderValuet =
                                  _sliderValue[i].round().toString();
                            }
                          });
                        },
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          print(_sliderValue);
                          if (i == 9) {
                            Navigator.of(context, rootNavigator: true).pop();
                            adderqscore(_erqscore(_sliderValue));
                            /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Questioanires()),
                            );*/
                          }
                          setState(() {
                            if (i == 8) {
                              button = 'Finish';
                            }

                            print(i);
                            i += 1;
                          });
                        },
                        child: Text(button,
                            style: TextStyle(
                              fontFamily: 'Lato-Bold',
                              color: Colors.white,
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
