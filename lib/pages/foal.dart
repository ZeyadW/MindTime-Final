import 'package:flutter/material.dart';
//import 'package:medico/widgets/questionaires/BMIS.dart';
import 'package:medico/widgets/questionaires/FOA.dart';

class Foal extends StatefulWidget {
  @override
  _FoalState createState() => _FoalState();
}

class _FoalState extends State<Foal> {
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
      body: SingleChildScrollView(child: Center(child: Foa())),
    );
  }
}
