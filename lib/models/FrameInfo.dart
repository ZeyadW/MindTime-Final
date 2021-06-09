import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FrameInfo {
  String email = "khazbak@gmail.com";
  String videoid = "video495";
  var emotions = [];
  FrameInfo();
  FrameInfo.id(email, videoid) {
    this.email = email;
    this.videoid = videoid;
  }

  Future<List> getFrameInfo() async {
    print("in get frame info function");
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection('Users')
        .doc(email)
        .collection("VideoModelOutput")
        .doc("video495")
        .get();
    emotions = variable.get("Mood");
    print("after document snapshot");
    print(emotions);

    return emotions;
  }
}
