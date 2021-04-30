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
        backgroundColor: Colors.blue[900],
<<<<<<< HEAD
        
=======
>>>>>>> 11a3a2f5c2c50bfc6ef2791fb328644dfb29b473
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
