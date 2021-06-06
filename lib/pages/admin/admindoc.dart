import 'package:flutter/material.dart';
import 'package:medico/widgets/admin/addDoctorbutton.dart';
import 'package:medico/widgets/admin/doctors.dart';

class Admindoc extends StatefulWidget {
  @override
  _AdmindocState createState() => _AdmindocState();
}

class _AdmindocState extends State<Admindoc> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Adddoctorbutton(),
      ListAllDoctors(),
    ]);
  }
}
