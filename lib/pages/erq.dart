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
          'Emotional Regulation Test:',
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      body: SingleChildScrollView(child: Center(child: Erq())),
    );
  }
}
