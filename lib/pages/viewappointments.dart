import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/appointments/appointmentlistview.dart';
import '../widgets/appointments/appointmenttitle.dart';

class _ViewAppointments extends State<ViewAppointments> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
            onPressed: () {
              Navigator.of(context).pushNamed('/home');
            },
          ),
          title: Text('My Appointments '),
          backgroundColor: Theme.of(context).accentColor,
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
        ),
        backgroundColor: Theme.of(context).accentColor,
        body: new SingleChildScrollView(
          child: Column(
            children: [
              appointmentTitle(),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              new SingleChildScrollView(
                child: AppointmentListview(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ViewAppointments extends StatefulWidget {
  @override
  _ViewAppointments createState() => _ViewAppointments();
}
