import 'package:flutter/material.dart';
import 'package:medico/widgets/questionaires/ERQ.dart';

class Erql extends StatefulWidget {
  @override
  _ErqlState createState() => _ErqlState();
}

class _ErqlState extends State<Erql> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Emotional Regulation Questionnaire:',
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).accentColor,
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      body: SingleChildScrollView(child: Center(child: Erq())),
    );
  }
}
