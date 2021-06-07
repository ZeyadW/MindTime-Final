import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  String id = UniqueKey().toString();
  String name;
  String description;
  String state;
  Color color;
  String avatar;

  String password;
  String date;
  String email;
  String location;

  Doctor.init();
  Doctor(this.name, this.description, this.avatar, this.state);
  Doctor getCurrentDoctor() {
    return Doctor("Dr.Alina james", "B.Sc DDVL Demilitologist",
        "images/asset-1.png", "Closed To day");
  }

  Doctor.doc(
      {this.name,
      this.description,
      this.avatar,
      this.password,
      this.location,
      this.email});

  DocumentReference reference;

  Doctor.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['email'] != null),
        assert(map['location'] != null),
        assert(map['description'] != null),
        name = map['name'],
        email = map['email'],
        location = map['location'],
        description = map['description'];

  Doctor.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$location:$description:$email>";
}

class DoctorsList {
  List<Doctor> _doctorsList;
  DoctorsList() {
    this._doctorsList = [
      new Doctor("Dr.SALMA ABDELBAKI", "B.Sc DDVL Demilitologist",
          "images/drsalma.jpg", "4.2"),
      new Doctor("Dr.ADLY EL SHEIKH", "MBBCH, MSC, ABPSYCH PSYCHIATRIST ",
          "images/dradly.png", "4.0"),
      new Doctor("Dr. HANADI ABDALLA", "B.Sc DDVL Demilitologist ",
          "images/drhanadi.jpg", "4.3"),
      new Doctor(
          "Dr.Steve Robert",
          "B.Sc DDVL Demilitologist 26 years of experience",
          "images/asset-3.png",
          "Open To day"),
      new Doctor(
          "Dr.Nemeli Aaraf",
          "B.Sc DDVL Demilitologist 26 years of experience",
          "images/asset-6.png",
          "Closed To day"),
    ];
  }
  List<Doctor> get doctors => _doctorsList;

  Future<Doctor> adddoctor(
      email, password, description, date, location, name) async {
    await FirebaseFirestore.instance.collection("Therapists").doc(email).set({
      'name': name,
      'email': email,
      'password': password,
      'birthdate': date,
      'location': location,
      'description': description,
    });

    //setData take a map as input

    Doctor dr = new Doctor.doc(
        name: name,
        password: password,
        description: description,
        email: email,
        location: location);
    //myusers.add(u);*/
    return dr;
  }
}
