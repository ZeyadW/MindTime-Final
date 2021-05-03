import 'package:flutter/material.dart';
import '../widgets/Journal/journalform.dart';

class Journal extends StatefulWidget {
  @override
  _Journal createState() => _Journal();
}

class _Journal extends State<Journal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Journal '),
        backgroundColor: Theme.of(context).accentColor,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: new SingleChildScrollView(
              child: Column(children: [
            JournalForm(),
          ])),
        ),
      ),
    );
  }
}
