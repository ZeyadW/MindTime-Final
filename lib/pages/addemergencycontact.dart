import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/Addemergencycontact/AddemergencycontactForm.dart';
import 'package:medico/widgets/Addemergencycontact/AddemergencycontactForm.dart';

class Addemergencycontactscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*var row1 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(padding: EdgeInsets.only(top: 50.0)),
      ],
    );*/
    var row2 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Enter your emergency contact details',
          style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
    var row3 = Container(
      //mainAxisSize: MainAxisSize.min,
      child: Image(
        image: AssetImage('images/gps.png'),
        width: 140,
        height: 140,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Center(
          child: Container(
              child: new SingleChildScrollView(
        child: Column(
          children: <Widget>[row3, row2, AddemergencycontactForm()],
        ),
      ))),
    );
  }
}
