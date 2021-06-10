import 'package:flutter/material.dart';
import 'package:medico/widgets/admin/addDoctorbutton.dart';
import 'package:medico/widgets/admin/doctors.dart';
import 'package:medico/widgets/viewdrform.dart';
import 'package:medico/config/app_config.dart' as config;

class Viewdr extends StatefulWidget {
  @override
  _ViewdrState createState() => _ViewdrState();
}

class _ViewdrState extends State<Viewdr> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0)),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            /*
            Navigator.of(context).pushNamed('/home',
                arguments: [widget.currentUser.name, widget.currentUser.email]);*/
          },
        ),
        backgroundColor: config.Colors().mainDarkColor(1),
        title: Text(
          'My profile',
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ViewdrForm(),
    ));
  }
}

