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
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();

            /*  Navigator.of(context).pushNamed('/home',
                arguments: [currentUser.name, currentUser.email]);*/
          },
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'Fear of Abndonment:',
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      body: SingleChildScrollView(child: Center(child: Foa())),
    );
  }
}
