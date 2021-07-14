import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:medico/widgets/Journal/editjournal.dart';
import 'package:medico/models/diaries.dart' as d;

class ViewJournaldoc extends StatefulWidget {
  var diary = new d.Diaries();
  ViewJournaldoc(this.diary);
  @override
  _ViewJournaldocstate createState() => _ViewJournaldocstate(diary);
}

class _ViewJournaldocstate extends State<ViewJournaldoc> {
  var diary = new d.Diaries();
  _ViewJournaldocstate(this.diary);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'Journal:',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: //SafeArea(
          // child:
          Center(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
          ),
          child: new SingleChildScrollView(
              child: Column(children: [
            EditJournalState(this.diary),
          ])),
        ),
      ),
      // ),
    );
  }

  Widget EditJournalState(d.Diaries diaryy) {
    final textcontroller = TextEditingController(text: diaryy.text);
    final titlecontroller = TextEditingController(text: diaryy.title);
    final _formKey = GlobalKey<FormState>();
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
                      child: Container(
                        width: 400.0,
                        height: 500.0,
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
                        child: Text(
                          textcontroller.text,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 22,
                          ),
                        ),
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
}
