import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medico/models/appointments.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:medico/models/doctor.dart';

class appointment {
  List SessionsTimes;
  var SessionDate;
  var datecreated;
  var SessionsPerDay;
  var appointmentID;
  DoctorsList dr = DoctorsList();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var email;
  DocumentReference reference;
  appointment({this.SessionsTimes, this.SessionDate});

  appointment.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['SessionsTimes'] != null),
        assert(map['SessionDate'] != null),
        assert(map['appointmentID'] != null),
        SessionsTimes = map['SessionsTimes'],
        SessionDate = map['SessionDate'],
        appointmentID = map['appointmentID'],
        datecreated = map['datecreated'];

  appointment.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Future<bool> createAppointment(
      SessionsTimes, SessionDate, SessionsPerDay) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.email = prefs.getString('email');
    final String rand = '${new Random().nextInt(10000)}';
    String appointmentname = 'Appointment' + rand;
    await _db
        .collection('Therapists')
        .doc(email)
        .collection('Appointments')
        .doc(appointmentname)
        .set({
      "appointmentID": appointmentname,
      "SessionsTimes": SessionsTimes,
      "SessionDate": SessionDate,
      "SessionsPerDay": SessionsPerDay,
      "datecreated": DateTime.now(),
    });
    return true;
  }

  Future<bool> DeleteAppointment(DocumentSnapshot snap, appointmentID) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.email = prefs.getString('email');
    await _db
        .collection("Therapists")
        .doc(email)
        .collection("Appointments")
        .doc(appointmentID)
        .delete();
    return true;
  }

  Future<bool> updateAppointment(
      SessionsTimes, SessionDate, SessionsPerDay) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.email = prefs.getString('email');
    await _db
        .collection("Therapists")
        .doc(email)
        .collection("Appointments")
        .doc(appointmentID)
        .update({
      "SessionsTimes": SessionsTimes,
      "SessionsPerDay": SessionsPerDay,
      "SessionDate": SessionDate,
    });
    return true;
  }
}

class Appointment {
  String id = UniqueKey().toString();
  Doctor doctor;
  String date;

  Appointment(this.date, this.doctor);
}

class ApointmentList {
  Doctor currentDoctor = new Doctor.init().getCurrentDoctor();
  List<Appointment> _appointmentList;
  ApointmentList() {
    this._appointmentList = [
      new Appointment("14 Decembre 2019", currentDoctor),
      new Appointment("10 Novembre 2019", currentDoctor),
      new Appointment("12 Octobre 2019", currentDoctor),
    ];
  }
  List<Appointment> get appointment => _appointmentList;
}
