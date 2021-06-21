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
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();

            //  Navigator.of(context).pushNamed('/home', arguments:[widget.currentUser.name]);
          },
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'Add Journal ',
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
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
