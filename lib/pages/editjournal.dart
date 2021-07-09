import 'package:flutter/material.dart';

import 'package:medico/widgets/Journal/editjournal.dart';
import 'package:medico/models/diaries.dart' as d;

class EditJournalM extends StatefulWidget {
  var diary = new d.Diaries();
  EditJournalM(this.diary);
  @override
  _EditJournal createState() => _EditJournal(diary);
}

class _EditJournal extends State<EditJournalM> {
  var diary = new d.Diaries();
  _EditJournal(this.diary);
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
            /*   Navigator.of(context).pushNamed('/home',
                arguments: [widget.currentUser.name, widget.currentUser.email]);*/
          },
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'Edit Journal:',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            child: new SingleChildScrollView(
                child: Column(children: [
              EditJournal(this.diary),
            ])),
          ),
        ),
      ),
    );
  }
}
