import 'package:flutter/material.dart';
//import 'package:medico/pages/viewjournals.dart';
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
    Widget okButton = FlatButton(
      child: Text(
        "ok",
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    final textcontroller = TextEditingController(text: diary.text);
    final titlecontroller = TextEditingController(text: diary.title);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).accentColor),
              child: Column(children: <Widget>[
                Row(children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Enter your Journal",
                      style: TextStyle(
                        fontSize: 16,
                        //color: Theme.of(context).accentColor,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 180)),
                ]),
                Padding(
                  padding: const EdgeInsets.all(10.0),
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
                    child: SingleChildScrollView(
                      child: TextFormField(
                        maxLines: 15,
                        controller: textcontroller,
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            print("emptyyyy2");
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(34.0),
                        topRight: Radius.circular(34.0),
                        bottomRight: Radius.circular(34.0),
                        bottomLeft: Radius.circular(34.0),
                      ),
                    ),
                    child: FlatButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          updateJournal(
                              this.diary, textcontroller, titlecontroller);
//Navigator.of(context, rootNavigator: true).pop();
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("updated successfully"),
                                actions: [okButton],
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        'Update',
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return UpdateForm();
  }
}
