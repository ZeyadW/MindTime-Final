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

/*
            Navigator.of(context).pushNamed('/home',
                arguments: [widget.currentUser.name, widget.currentUser.email]);*/
          },
        ),
        backgroundColor: Theme.of(context).accentColor,

        title: Text(
          'Data input Statistics:',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),

//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      body: Stat(),
    );
  }
}
