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
<<<<<<< HEAD
        backgroundColor: const Color(0xff68b2a0),
      ),
      backgroundColor: const Color(0xffe0ecde),
=======
        backgroundColor: Colors.blue[900],
      ),
      backgroundColor: Colors.blue[900],
>>>>>>> 11a3a2f5c2c50bfc6ef2791fb328644dfb29b473
      body: SafeArea(
        child: Container(
          child: new SingleChildScrollView(
              child: Column(children: [
            EditJournal(this.diary),
          ])),
        ),
      ),
    );
  }
}
