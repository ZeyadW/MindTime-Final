import 'package:flutter/material.dart';
import 'package:medico/pages/addemergencycontact.dart';

class Addemergencybutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 850,
      height: 70,
      color: Colors.blue[900],
      margin: EdgeInsets.only(left: 20.0, top: 10.0, right: 0.0, bottom: 0.0),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 200.0,
            top: 10.0,
            right: 0.0,
            bottom: 0.0,
          ),
          child: FlatButton(
            child: Text(
              '+ Emergency Contact',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Addemergencycontactscreen()),
              );
            },
          ),
        )
      ]),
    );
  }
}
