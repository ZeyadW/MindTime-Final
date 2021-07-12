import 'package:flutter/material.dart';
import 'package:medico/config/app_config.dart' as config;
import 'package:medico/pages/doctoraccount.dart';
import 'package:medico/pages/home.dart';
//import 'package:medico/pages/JoinSession.dart';
//import 'package:medico/pages/editappointment.dart';
import 'package:medico/pages/viewappointmentsdoctor.dart';
import 'package:medico/widgets/patientslistview.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(
      home: AORAppointment(),
    ));
Future<bool> getUser() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  username = prefs.getString('username');
  email = prefs.getString('email');
  print("username in get user AOR" + username);
  print("email in get user AOR" + email);
  return true;
}

class AORAppointment extends StatefulWidget {
  @override
  AORAppointmentState createState() {
    getUser();
    return new AORAppointmentState();
  }
}

class AORAppointmentState extends State<AORAppointment> {
  bool pressed = false;
  final ZoomIDController = TextEditingController();
  final ZoomPasswordController = TextEditingController();
  var username;
  var email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Booked appointments',
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 40.0)),
                    new SingleChildScrollView(
                      child: PatientListview(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
