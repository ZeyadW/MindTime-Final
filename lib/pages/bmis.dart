import 'package:flutter/material.dart';
import 'package:medico/widgets/questionaires/BMIS.dart';

class Bmisl extends StatefulWidget {
  @override
  _BmislState createState() => _BmislState();
}

class _BmislState extends State<Bmisl> {
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
        backgroundColor: Colors.blue[900],
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      body: SingleChildScrollView(child: Center(child: Bmis())),
    );
  }
}
