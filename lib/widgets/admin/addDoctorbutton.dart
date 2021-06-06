import 'package:flutter/material.dart';
import 'package:medico/pages/admin/newdoctor.dart';
import 'package:medico/pages/choosediary.dart';
import 'package:medico/pages/journal.dart';
//import 'package:project_mobile/widgets/viewjournal/listalljournals.dart' as l;
//import 'package:cloud_firestore/cloud_firestore.dart';

class Adddoctorbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textColor: Colors.white,
      color: Theme.of(context).accentColor,
      child: Text('+ Add a new Doctor'),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Doctorsignup()),
        );
      },
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),
    );
  }
}
