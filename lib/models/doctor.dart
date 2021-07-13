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
    return Doctor("Dr.ADLY EL SHEIKH", "B.Sc DDVL Demilitologist",
        "images/dradly.png", "Closed To day");
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

  Future<List<Doctor>> getarraydoctors() async {
    QuerySnapshot snap =
        await FirebaseFirestore.instance.collection('Therapists').get();
    _doctorsList = new List<Doctor>();
    var list = snap.docs;
    print("snappp list");
    print(list.length);
    for (int i = 0; i < snap.docs.length; i++) {
      var a = snap.docs[i];
      print("snap docs[i]" + i.toString() + a.toString());
      DocumentSnapshot variable = await FirebaseFirestore.instance
          .collection('Therapists')
          .doc(a.id)
          .get();
      print("variabllleee from snapppppp");
      print(variable.data());
      print("snap variable name[i]" + variable.get("name"));
      _doctorsList.add(
        new Doctor(
            variable.get("name"), variable.get("description"), "", "4.2"),
      );
      print(_doctorsList.length);

      //print(a.documentID);
      // print(snap.docs[0].data().values);
    }
    print(_doctorsList);
    return _doctorsList;

    // int count = 0;
    //List<Doctor> drlist = new List<Doctor>();
    /* var toto = await kk(snap);
    print("toto");
    print("toto" + toto.toString());
    if (toto == true) {
      print("awaitinggg kk snap");
      print(toto.toString());
      // this._doctorsList = drlist.toList();
      print("drrr listtt in model");
      print(_doctorsList);
      print(_doctorsList.length);
      return _doctorsList;
    }
    print("agterrrrrr ifff toto");
    print(toto.toString());*/
  }

  /* Future<bool> kk(QuerySnapshot snap) async {
    snap.docs.forEach((document) async {
      DocumentSnapshot variable = await FirebaseFirestore.instance
          .collection('Therapists')
          .doc(document.id)
          .get();
      if (variable.data() != null) {
        print("dr email in kk");
        print(variable.get("email"));
        _doctorsList.add(
          new Doctor(
              variable.get("name"), variable.get("description"), "", "4.2"),
        );
        print("entry added to doc list" + variable.get("name"));
      } else {
        print("variable null");
        print(_doctorsList.length);
        return false;
      }

      /  _doctorsList.add(
        new Doctor(
            variable.get("name"), variable.get("description"), "", "4.2"),
      );/
    });
    if (_doctorsList.length != 0) {
      print(_doctorsList.length);

      return Future.value(true);
    } else {
      await kk(snap);
    }
  }*/

  DoctorsList() {
    /* var variable = FirebaseFirestore.instance
        .collection("Therapists")
        .orderBy('name', descending: true)
        .get();
    print("snap");
    //this._doctorsList =
    //getarraydoctors();
    print(variable.runtimeType);*/
    /* this._doctorsList = [
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
    ];*/
  }

  /* Future<List<Doctor>> get doctors async {
    return await _doctorsList;
  }*/
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
