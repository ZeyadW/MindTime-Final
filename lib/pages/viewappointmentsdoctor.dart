import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/appointments/appointmentlistviewdoctor.dart';
import 'package:medico/config/app_config.dart' as config;

class _ViewAppointments extends State<ViewAppointmentsDoctor> {
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
            'Appointments',
            style: TextStyle(
              fontSize: 22.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: config.Colors().mainDarkColor(1),
        body: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  new SingleChildScrollView(
                    child: AppointmentListviewDoctor(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ViewAppointmentsDoctor extends StatefulWidget {
  @override
  _ViewAppointments createState() => _ViewAppointments();
}
