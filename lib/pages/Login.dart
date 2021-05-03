import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/Login/Loginform.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var row1 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(padding: EdgeInsets.only(top: 50.0)),
        Text(
          'Login',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
    var row2 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Enter your login details to access your account',
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ],
    );
    return Scaffold(
      body: Center(
          child: Container(
              child: new SingleChildScrollView(
        child: Column(
          children: <Widget>[row1, row2, LoginForm()],
        ),
      ))),
    );
  }
}
