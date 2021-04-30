import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medico/models/emergencycontact.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String username;
  String password;
  String emergencycontact;
  String date;
  String email;
  String imagepath;
  String emergencycontactname;
  List<Contact> emergencyContacts;
  User(
      {this.username,
      this.password,
      this.emergencycontact,
      this.date,
      this.email,
      this.imagepath,
      this.emergencycontactname});

  String getusername() {
    return username;
  }

  Future<String> getEmail() {
    return Future.value(email);
  }
}

class Users {
  User signup(
      username, password, emergency, date, email, emergencycontactname) {
    adduser(username, password, emergency, date, email, emergencycontactname);
    User rr = User(
        username: username,
        password: password,
        date: date,
        email: email,
        emergencycontactname: emergencycontactname);
    return rr;
  }

  Future<User> adduser(
      username, password, emergencyname, date, email, emergencycontact) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('email', email);

    await Firestore.instance.collection("Users").document(email).setData({
      'emergencyphone': emergencycontact,
      'emergencyname': emergencyname,
      'birthdate': date,
      'password': password,
      'username': username,
    });

    await Firestore.instance
        .collection("Users")
        .doc(email)
        .collection('EmergecyContacts')
        .doc(emergencycontact)
        .set({
      'name': emergencyname,
      'phone': emergencycontact,
    });

    //setData take a map as input

    User u = new User(
        username: username,
        password: password,
        emergencycontact: emergencycontact,
        date: date,
        email: email,
        emergencycontactname: emergencyname);
    //myusers.add(u);
    return u;
  }

  String username;
  var phone;
  Future<bool> login1(email, password) async {
    DocumentSnapshot variable =
        await FirebaseFirestore.instance.collection('Users').doc(email).get();
    if (variable.data() == null) {
      return false;
    } else {
      var passworduser = variable.get("password");
      if (passworduser == password) {
        this.username = variable.get("username");
        this.phone = variable.get("emergencyphone");
<<<<<<< HEAD
        print("username in user model"+ this.username);
=======
>>>>>>> 11a3a2f5c2c50bfc6ef2791fb328644dfb29b473
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', this.username);
        prefs.setString('email', email);
        prefs.setBool('isLoggedIn', true);
        return true;
      } else {
        return false;
      }
    }
  }

  Future<User> validatelogin(email, password) async {
    var log1 = await login1(email, password);

    if (log1) {
      User u = User(
          email: email, username: this.username, emergencycontact: this.phone);

      return u;
    } else {
      return null;
    }
  }
}
