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
      // backgroundColor: Color(accentColor),
      appBar: AppBar(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            /*  Navigator.of(context).pushNamed('/home',
                arguments: [currentUser.name, currentUser.email]);*/
          },
        ),
        title: Text(
          'Emergency Contacts:',
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).accentColor,
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
