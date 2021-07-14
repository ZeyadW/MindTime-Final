//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FrameInfo {
  String email = "khazbak@gmail.com";
  String videoid = "video495";
  var emotions = [];
  FrameInfo();
  FrameInfo.id(email, videoid) {
    this.email = email;
    this.videoid = videoid;
  }

  Future<List> getassesmentsInfo() async {
    List<FrameInfo> _videoslist;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    var emotions;
    var emotionss;
    print(email);
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection('Users')
        .doc(email)
        .collection('assesments')
        .get();

    _videoslist = new List<FrameInfo>();

    var list = snap.docs;
    print('d');
    print(snap.docs);
    print("snappp list");
    print(list.length);

    for (int i = 0; i < snap.docs.length; i++) {
      var a = snap.docs[i];
      print("snap docs[i]" + i.toString() + a.toString());

      DocumentSnapshot variable = await FirebaseFirestore.instance
          .collection('Users')
          .doc(email)
          .collection("assesments")
          .doc(a.id)
          .get();
          SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble('bmi', 115.0);

      emotionss = variable.get("score");
      print("after document snapshot");
      print(emotionss);
    }
    return emotions;
  }

  Future<List> getFrameInfo() async {
    List<FrameInfo> _videoslist;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    var emotions;
    print(email);
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection('Users')
        .doc(email)
        .collection('VideoModelOutput')
        .get();

    _videoslist = new List<FrameInfo>();

    var list = snap.docs;
    print('d');
    print(snap.docs);
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
    }
    return emotions;
  }
}
