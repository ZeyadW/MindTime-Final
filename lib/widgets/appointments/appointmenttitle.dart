import 'package:flutter/material.dart';
import 'package:medico/pages/addappointment.dart';
import 'package:medico/config/app_config.dart' as config;

class appointmentTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 850,
      height: 30,
      color: config.Colors().mainDarkColor(1),
      margin: EdgeInsets.only(left: 20.0, top: 10.0, right: 0.0, bottom: 0.0),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 220.0,
            top: 0.0,
            right: 0.0,
            bottom: 0.0,
          ),
          child: FlatButton(
            child: Text(
              '+ Appointment',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddAppointment()),
              );
            },
          ),
        )
      ]),
    );
  }
}
