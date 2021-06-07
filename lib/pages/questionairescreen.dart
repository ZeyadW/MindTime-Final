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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
        ),

        title: Text(
          'Assesment:',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).accentColor,
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      body: Questionairelist(),
    );
  }
}
