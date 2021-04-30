import 'package:flutter/material.dart';
import 'package:medico/pages/erq.dart';
import 'package:medico/pages/bmis.dart';
import 'package:medico/pages/foal.dart';

class Questionairelist extends StatefulWidget {
  @override
  _QuestionairelistState createState() => _QuestionairelistState();
}

class _QuestionairelistState extends State<Questionairelist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('BMIS'),
              trailing: Icon(Icons.chevron_right_sharp),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bmisl()),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Fear of abndonment measure'),
              trailing: Icon(Icons.chevron_right_sharp),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Foal()),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text('ERQ'),
              trailing: Icon(Icons.chevron_right_sharp),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Erql()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
