import 'package:flutter/material.dart';
import 'package:medico/widgets/stats/stat.dart';

class Statscreen extends StatefulWidget {
  @override
  _StatscreenState createState() => _StatscreenState();
}

class _StatscreenState extends State<Statscreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Data input Statistics:',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[900],
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      body: Stat(),
    );
  }
}
