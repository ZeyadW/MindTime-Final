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
            EditJournal(this.diary),
          ])),
        ),
      ),
      // ),
    );
  }
}
