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
        /* shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0)),
        ),*/
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
          'Add Journal',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      backgroundColor: Theme.of(context).accentColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
          ),
          child: new SingleChildScrollView(
              child: Column(children: [
            JournalForm(),
          ])),
        ),
      ),
    );
  }
}
