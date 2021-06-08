import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/Editprofile/editform.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  var variable;
  Future<bool> getUser(email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    variable =
        await FirebaseFirestore.instance.collection('Users').doc(email).get();
    setState(() {
      email = prefs.getString('email');
    });
    return true;
  }

  Widget build(BuildContext context) {
    var row1 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(padding: EdgeInsets.only(top: 50.0)),
        Text(
          'Edit Profile',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
    var row2 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Enter your new account details',
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ],
    );
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

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

/*
            Navigator.of(context).pushNamed('/home',
                arguments: [widget.currentUser.name, widget.currentUser.email]);*/
          },
        ),
        title: Text('Edit Profile '),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Center(
          child: Container(
              child: new SingleChildScrollView(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
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
              children: <Widget>[row1, row2, EditProfileForm()],
            ),
          ),
        ),
      ))),
    );
  }
}
