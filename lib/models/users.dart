import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';
import 'package:medico/models/emergencycontact.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class User {
  String username;
  String password;
  String emergencycontact;
  String date;
  String email;
  String imagepath;
  String emergencycontactname;
  String therapist;
  List<Contact> emergencyContacts;
  User(
      {this.username,
      this.password,
      this.emergencycontact,
      this.date,
      this.email,
      this.imagepath,
      this.emergencycontactname,
      this.therapist});

  String getusername() {
    return username;
  }

  Future<String> getEmail() {
    return Future.value(email);
  }
}

class Patient {
  String username;
  String date;
  String time;
  String email;
  Patient();
  Patient.p(this.username, this.date, this.time, this.email);
}

class PatientL {
  String id = UniqueKey().toString();
  Patient p;
  String date;

  PatientL(this.date, this.p);
}

class PatientList {
  List<Patient> _patientList;

  Future<List<Patient>> getarraypatients() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var docemail = prefs.getString('email');
    print("doc emailllll" + docemail);

    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection('Therapists')
        .doc(docemail)
        .collection("patients")
        .get();

    _patientList = new List<Patient>();
    print("snappp list");
    print(snap.docs.length);
    var l = snap.docs.length;
    for (int i = 0; i < l; i++) {
      var a = snap.docs[i];
      DocumentSnapshot variable =
          await FirebaseFirestore.instance.collection('Users').doc(a.id).get();
      print("variabllee");
      print(variable.data());
      print("snap docs[i]" + i.toString() + a.toString());
      print(a.id);
      _patientList.insert(
          i, new Patient.p(variable.get("username"), "", "", a.id));
      //_patientList.add(new Patient(variable.get("username"), "", "", a.id));
      print("a.id: " + a.id);
      print(_patientList.length);
      print(_patientList[i]);
    }

    return _patientList;
  }
}

class Users {
  var therapist = "";
  User signup(
      username, password, emergency, date, email, emergencycontactname) {
    adduser(username, password, emergency, date, email, emergencycontactname,
        therapist);
    User rr = User(
        username: username,
        password: password,
        date: date,
        email: email,
        emergencycontactname: emergencycontactname);
    return rr;
  }

  Future<User> adduser(username, password, emergencyname, date, email,
      emergencycontact, therapist) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('email', email);

    await FirebaseFirestore.instance.collection("Users").doc(email).set({
      'emergencyphone': emergencycontact,
      'emergencyname': emergencyname,
      'birthdate': date,
      'password': password,
      'username': username,
      'therapist': "",
    });

    await FirebaseFirestore.instance
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
        therapist: therapist,
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
        this.therapist = variable.get("therapist");
        print("username in user model" + this.username);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', this.username);
        prefs.setString('email', email);
        prefs.setString('therapist', this.therapist);
        print("Email: Login + $email");
        prefs.setString('emergencynumber', this.phone);
        prefs.setBool('isLoggedIn', true);
        return true;
      } else {
        return false;
      }
    }
  }

  Future<bool> login2(email, password) async {
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection('Therapists')
        .doc(email)
        .get();
    if (variable.data() == null) {
      return false;
    } else {
      var passworduser = variable.get("password");
      if (passworduser == password) {
        this.username = variable.get("name");
        //  this.therapist = variable.get("therapist");
        print("username in user model" + this.username);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('name', this.username);
        prefs.setString('email', email);
        //prefs.setString('therapist', this.therapist);
        print("Email: Login + $email");
        prefs.setString('emergencynumber', this.phone);
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
          email: email, password: this.username, emergencycontact: this.phone);

      return u;
    } else {
      return null;
    }
  }

  Future<User> validateloginTherapist(email, password) async {
    var log1 = await login2(email, password);

    if (log1) {
      User u = User(
          email: email, password: this.username, emergencycontact: this.phone);

      return u;
    } else {
      return null;
    }
  }
}
