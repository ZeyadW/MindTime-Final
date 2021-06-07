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
          'Enter your new account details to edit your account',
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ],
    );

    return Scaffold(
      body: Center(
          child: Container(
              child: new SingleChildScrollView(
        child: Column(
          children: <Widget>[row1, row2, EditProfileForm()],
        ),
      ))),
    );
  }
}
