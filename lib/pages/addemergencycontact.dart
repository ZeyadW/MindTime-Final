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
        image: AssetImage('images/MEDICAL.png'),
        width: 140,
        height: 140,
      ),
    );
    return Scaffold(
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
          },
        ),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Center(
          child: Container(
              child: new SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  spreadRadius: 5,
                  blurRadius: 20,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0)),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[row3, row2, AddemergencycontactForm()],
            ),
          ),
        ),
      ))),
    );
  }
}
