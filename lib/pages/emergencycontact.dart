import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/emergencycontact/emergency_contacts.dart';
import '../widgets/emergencycontact/addemergencycontactbutton.dart';
import 'package:provider/provider.dart';
import 'package:medico/models/contactprovider.dart';

class ViewEmergencyContactscreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: Text(
          'Emergency Contacts:',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[900],
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      body: Column(
        children: [
          Addemergencybutton(),
          Consumer<ContactProvider>(
              builder: (context, counter, child) => Listemergencycontacts())
        ],
      ),
    );
  }
}
