import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:medico/models/appointments.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:medico/models/doctor.dart';

class appointment {
  List sessionsTimes;
  var sessionDate;
  var datecreated;
  var sessionsPerDay;
  var appointmentID;
  DoctorsList dr = DoctorsList();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  var email;
  DocumentReference reference;
  appointment({this.sessionsTimes, this.sessionDate});

  appointment.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['SessionsTimes'] != null),
        assert(map['SessionDate'] != null),
        assert(map['appointmentID'] != null),
        sessionsTimes = map['SessionsTimes'],
        sessionDate = map['SessionDate'],
        appointmentID = map['appointmentID'],
        datecreated = map['datecreated'];

  appointment.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Future<bool> createAppointment(
      sessionsTimes, sessionDate, sessionsPerDay) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.email = prefs.getString('email');
    final String rand = '${new Random().nextInt(10000)}';
    String appointmentname = 'Appointment' + rand;
    String isbooked = '0';
    await _db
        .collection('Therapists')
        .doc(email)
        .collection('Appointments')
        .doc(appointmentname)
        .set({
      "appointmentID": appointmentname,
      "SessionsTimes": sessionsTimes,
      "SessionDate": sessionDate,
      "SessionsPerDay": sessionsPerDay,
      "isBooked": isbooked,
      "ZoomMeetingID": isbooked,
      "ZoomMeetingPassword": isbooked,
      "IsAccepted": isbooked,
      "datecreated": DateTime.now(),
    });
    return true;
  }

  Future<bool> seleteAppointment(DocumentSnapshot snap, appointmentID) async {
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
      sessionsTimes, sessionDate, sessionsPerDay) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.email = prefs.getString('email');
    await _db
        .collection("Therapists")
        .doc(email)
        .collection("Appointments")
        .doc(appointmentID)
        .update({
      "SessionsTimes": sessionsTimes,
      "SessionsPerDay": sessionsPerDay,
      "SessionDate": sessionDate,
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
