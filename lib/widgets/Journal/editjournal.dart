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

  Future<bool> UpdateJournal(diary, textcontroller, titlecontroller) async {
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
<<<<<<< HEAD
                style: TextStyle(color: Colors.green),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 100.0),
                    labelText: "Diary",
                    labelStyle: TextStyle(color: Colors.green),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
=======
                style: TextStyle(color: Colors.blue[900]),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 100.0),
                    labelText: "Diary",
                    labelStyle: TextStyle(color: Colors.blue[900]),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[900])),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[900]),
>>>>>>> 11a3a2f5c2c50bfc6ef2791fb328644dfb29b473
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
<<<<<<< HEAD
              gradient: RadialGradient(
                center: Alignment(-0.88, -1.0),
                radius: 1.35,
                colors: [const Color(0xff7be495), const Color(0xff329d9c)],
=======
              gradient: new LinearGradient(
                colors: [
                  Color.fromRGBO(18, 11, 232, 1.0),
                  Color.fromRGBO(107, 164, 249, 1.0)
                ],
>>>>>>> 11a3a2f5c2c50bfc6ef2791fb328644dfb29b473
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
                    UpdateJournal(this.diary, textcontroller, titlecontroller);
                  }
<<<<<<< HEAD
=======
                  Navigator.of(context).pop();

>>>>>>> 11a3a2f5c2c50bfc6ef2791fb328644dfb29b473
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewJournals()),
                  );
                },
                child: Text('Update'),
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
        height: 475.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34.0),
            topRight: Radius.circular(34.0),
            bottomRight: Radius.circular(34.0),
            bottomLeft: Radius.circular(34.0),
          ),
          color: Colors.white,
        ),
        child: UpdateForm(),
      ),
    ));
  }
}
