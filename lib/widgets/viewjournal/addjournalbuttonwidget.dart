import 'package:flutter/material.dart';
import 'package:medico/pages/choosediary.dart';
//import 'package:medico/pages/journal.dart';
//import 'package:project_mobile/widgets/viewjournal/listalljournals.dart' as l;
//import 'package:cloud_firestore/cloud_firestore.dart';

class Addjournalbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 850,
      height: 70,
      color: Colors.white,
      margin: EdgeInsets.only(left: 0.0, top: 0.0, right: 20.0, bottom: 0.0),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 220.0,
            top: 10.0,
            right: 0.0,
            bottom: 0.0,
          ),
          child: FlatButton(
            child: Text(
              '+ Journals',
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/addjournaltext');

              /*  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChooseDiary()),
              );
              */
            },
          ),
        ),
      ]),
    );
  }
}
