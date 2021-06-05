import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widgets/Login/Loginform.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

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
          'Enter your login details ',
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.of(context).pushNamed('/signup');
          },
        ),

        backgroundColor: Theme.of(context).accentColor,

//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
      ),
      body: Center(
          child: Container(
              child: new SingleChildScrollView(
        child: Center(
          child: Container(
            height: queryData.size.width,
            width: queryData.size.width - 20,
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
              children: <Widget>[row1, row2, LoginForm()],
            ),
          ),
        ),
      ))),
    );
  }
}
