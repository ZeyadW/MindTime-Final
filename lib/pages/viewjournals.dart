import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/viewjournal/addjournalbuttonwidget.dart';
import '../widgets/viewjournal/listalljournals.dart';

class ViewJournals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: Text(
          'Journals:',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[900],

//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      body: Column(
        children: [
          Addjournalbutton(),
          ListAllJournals(),
        ],
      ),
    );
  }
}
