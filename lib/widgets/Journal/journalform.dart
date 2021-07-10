import 'package:flutter/material.dart';
//import 'package:medico/pages/viewjournals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:medico/models/diaries.dart';

class Journal {
  final String title;
  final String email;
  final String DiaryContent;

  Journal({this.title, this.email, this.DiaryContent});

  factory Journal.fromJson(Map<String, dynamic> json) {
    return Journal(
      title: json['title'],
      email: json['email'],
      DiaryContent: json['DiaryContent'],
    );
  }
}

class JournalForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

DateTime now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);

class LoginFormState extends State<JournalForm> {
  var email;

  Future<Diaries> sendDiaryToApi(
      String DiaryContent, String email, String DiaryTitle) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    print("Email in SendVidToRestAPI " + email);

    var DiaryEnc = jsonEncode(<String, String>{
      'Diary Content': DiaryContent,
      'Email': email,
    });
    print('REST API: ' + DiaryEnc);

    final response = await http.post(Uri.http(
        '143.198.113.232', '' + DiaryContent + "-" + email + "-" + DiaryTitle));
    if (response.statusCode == 200) {
      Journal.fromJson(jsonDecode(response.body));
    } else {
      // return Album.fromJson(jsonDecode(response.body));
      throw Exception(response.body);
    }
  }

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
    sendDiaryToApi(textcontroller.text, email, titlecontroller.text);
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
          //  Padding(padding: EdgeInsets.fromLTRB(30, 20, 30, 0)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // padding: EdgeInsets.all(10),
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
              child: new SingleChildScrollView(
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLines: 2,
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
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).accentColor),
              child: Column(children: <Widget>[
                Row(children: <Widget>[
                  Text(
                    "Enter your Journal",
                    style: TextStyle(
                      fontSize: 16,
                      //color: Theme.of(context).accentColor,
                      color: Colors.white,
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 180)),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.done_rounded),
                      //color: Theme.of(context).accentColor,
                      color: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a Snackbar.
                          createDiary(textcontroller, titlecontroller);
                        }
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                    ),
                  ),
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
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                //  Padding(padding: const EdgeInsets.symmetric(vertical: 20.0))
              ]),
            ),
          ),

          // Padding(padding: EdgeInsets.only(top: 10.0)),
          /* Container(
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
          Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),*/
        ],
      ),
    );
  }
}
