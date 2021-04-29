import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medico/widgets/Addemergencycontact/AddemergencycontactForm.dart';

class Addemergencycontactscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var row1 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(padding: EdgeInsets.only(top: 50.0)),
      ],
    );
    var row2 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Enter your emergency contact details',
          style: TextStyle(
              fontSize: 15,
              color: Colors.blue[900],
              fontWeight: FontWeight.bold),
        ),
      ],
    );
    var row3 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(
          image: AssetImage('images/med.png'),
          width: 140,
          height: 140,
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
          child: Container(
              child: new SingleChildScrollView(
        child: Column(
          children: <Widget>[row3, row1, row2, AddemergencycontactForm()],
        ),
      ))),
    );
  }
}
