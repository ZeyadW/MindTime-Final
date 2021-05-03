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
        title: Text('Edit Journal '),
        backgroundColor: Theme.of(context).accentColor,
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
