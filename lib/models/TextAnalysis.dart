import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TextAnalysis {
  String selfharm;
  String emptiness;
  String anger;
  TextAnalysis({this.anger, this.selfharm, this.emptiness});
  void getAnalysisfromDB(email) async {
    DocumentSnapshot variable =
        await FirebaseFirestore.instance.collection('Users').doc(email).get();
  }
}
