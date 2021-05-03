import 'package:flutter/material.dart';
import 'package:medico/pages/viewjournals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JournalForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

DateTime now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);

class LoginFormState extends State<JournalForm> {
  var email;

  Future<bool> createDiary(textcontroller, titlecontroller) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.email = prefs.getString('email');
    print("creating record");
    print(textcontroller.text);
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(email)
        .collection('Diary')
        .doc(titlecontroller.text)
        .set({
      'title': titlecontroller.text,
      'text': textcontroller.text,
      'timestamp': date
    }); //setData take a map as input
    return true;
  }

  final textcontroller = TextEditingController();
  final titlecontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(30, 20, 30, 0)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.0),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x21329d9c),
                  offset: Offset(0, 13),
                  blurRadius: 34,
                ),
              ],
            ),
            child: TextFormField(
              controller: titlecontroller,
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                  labelText: 'Enter Journal Title',
                  labelStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                  )),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                    borderRadius: BorderRadius.circular(21.0),
                  )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                color: const Color(0xffffffff),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x21329d9c),
                    offset: Offset(0, 13),
                    blurRadius: 34,
                  ),
                ],
              ),
              child: TextFormField(
                controller: textcontroller,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 100.0),
                    labelText: 'Enter Journal',
                    labelStyle: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    )),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                      ),
                      borderRadius: BorderRadius.circular(21.0),
                    )),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.0),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x21329d9c),
                  offset: Offset(0, 13),
                  blurRadius: 34,
                ),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.0),
              gradient: new LinearGradient(
                  colors: [
                    Theme.of(context).accentColor,
                    Theme.of(context).accentColor,
                  ],
                  begin: const FractionalOffset(0.1, 1.0),
                  end: const FractionalOffset(0.8, 0.5),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x36329d9c),
                  offset: Offset(15, 15),
                  blurRadius: 40,
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: FlatButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.

                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    createDiary(textcontroller, titlecontroller);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewJournals()),
                  );
                },
                child: Text('Submit'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
