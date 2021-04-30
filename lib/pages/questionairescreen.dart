import 'package:flutter/material.dart';
import 'package:medico/widgets/questionaires/questioaireslist.dart';

class Questioanires extends StatefulWidget {
  @override
  _QuestioaniresState createState() => _QuestioaniresState();
}

class _QuestioaniresState extends State<Questioanires> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
<<<<<<< HEAD
          'Data input Statistics:',
=======
          'Assesments:',
>>>>>>> 11a3a2f5c2c50bfc6ef2791fb328644dfb29b473
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[900],
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      body: Questionairelist(),
    );
  }
}
