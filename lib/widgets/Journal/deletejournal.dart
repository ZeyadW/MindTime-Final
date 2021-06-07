import 'package:flutter/material.dart';
//import 'package:medico/pages/viewjournals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medico/models/diaries.dart' as d;

final db = FirebaseFirestore.instance;

class DeleteJournal extends StatefulWidget {
  var diary = d.Diaries();
  DeleteJournal(d.Diaries dd) {
    this.diary = dd;
  }
  @override
  DeleteJournalState createState() {
    return DeleteJournalState(this.diary);
  }
}

class DeleteJournalState extends State<DeleteJournal> {
  var diary; //= d.Diaries();
  DeleteJournalState(diary);

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
      ),
    ));
  }
}
