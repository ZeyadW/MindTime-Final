//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FrameInfo {
  String useremail;
  List videos;
  var emotions = [];
  FrameInfo();
  FrameInfo.id(email) {
    this.useremail = useremail;
  }
}

Future<List> getFrameInfo() async {
  List<FrameInfo> _videoslist;

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');

  var emotions = [];
  QuerySnapshot snap = await FirebaseFirestore.instance
      .collection('users')
      .doc(email)
      .collection('videos')
      .get();
  _videoslist = new List<FrameInfo>();
  var list = snap.docs;
  print("snappp list");
  print(list.length);
  for (int i = 0; i < snap.docs.length; i++) {
    var a = snap.docs[i];
    print("snap docs[i]" + i.toString() + a.toString());

    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection('Users')
        .doc(email)
        .collection("VideoModelOutput")
        .doc(a.id)
        .get();
    emotions = variable.get("Mood");
    print("after document snapshot");
    print(emotions);

    return emotions;
  }
}
