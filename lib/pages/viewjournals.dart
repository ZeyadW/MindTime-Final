import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medico/models/user.dart';
import '../widgets/viewjournal/addjournalbuttonwidget.dart';
import '../widgets/viewjournal/listalljournals.dart';

class ViewJournals extends StatelessWidget {
  User u;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
        ),
        title: Text(
          'Journals:',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).accentColor,

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
