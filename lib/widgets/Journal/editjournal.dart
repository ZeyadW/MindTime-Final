import 'package:flutter/material.dart';
import 'package:medico/pages/viewjournals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medico/models/diaries.dart' as d;
import 'package:shared_preferences/shared_preferences.dart';

final db = FirebaseFirestore.instance;
var email;

class EditJournal extends StatefulWidget {
  var diary = d.Diaries();
  EditJournal(d.Diaries dd) {
    this.diary = dd;
  }

  @override
  EditJournalState createState() {
    return EditJournalState(this.diary);
  }
}

DateTime now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);

class EditJournalState extends State<EditJournal> {
  var diary; //= d.Diaries();
  EditJournalState(this.diary);

  Future<bool> updateJournal(diary, textcontroller, titlecontroller) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');

    await FirebaseFirestore.instance
        .collection("Users")
        .doc(email)
        .collection('Diary')
        .doc(titlecontroller.text)
        .update({
      // 'title': titlecontroller.text,
      'text': textcontroller.text,
      'timestamp': date
    });

    return true;
  }

  Widget UpdateForm() {
    final textcontroller = TextEditingController(text: diary.text);
    final titlecontroller = TextEditingController(text: diary.title);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
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
          Padding(padding: const EdgeInsets.symmetric(vertical: 25.0)),
          Center(
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                gradient: RadialGradient(
                  center: Alignment(-0.88, -1.0),
                  radius: 1.35,
                  colors: [Colors.white, Colors.white],
                  stops: [0.0, 1.0],
                ),
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
                      updateJournal(
                          this.diary, textcontroller, titlecontroller);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewJournals()),
                    );
                  },
                  child: Text('Update'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: new SingleChildScrollView(
      child: Container(
        width: 385.1,
        height: 375.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34.0),
            topRight: Radius.circular(34.0),
            bottomRight: Radius.circular(34.0),
            bottomLeft: Radius.circular(34.0),
          ),
          color: Theme.of(context).accentColor,
        ),
        child: UpdateForm(),
      ),
    ));
  }
}
