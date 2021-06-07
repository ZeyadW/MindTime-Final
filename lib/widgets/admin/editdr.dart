import 'package:flutter/material.dart';
import 'package:medico/widgets/admin/editdrform.dart';

class Editdr extends StatefulWidget {
  //const Editdr({ Key? key }) : super(key: key);

  @override
  _EditdrState createState() => _EditdrState();
}

class _EditdrState extends State<Editdr> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Edit Therapist Info',
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).accentColor,
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      body: SingleChildScrollView(child: Center(child: EditdrForm())),
    );
  }
}
