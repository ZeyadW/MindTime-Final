import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medico/models/FrameInfo.dart';

class Moodswings {
  var email = "khazbak@gmail.com";
  var videoid = "video495";
  var emotions = [];
  var negative = ["anger", "fear", "disgust", "sad"];
  var positive = ["happy", "contempt"];
  var neutral = ["neutral", "surprise"];
  var frameInfo = new FrameInfo();
  Moodswings() {
    new FrameInfo.id(this.email, videoid);
  }
  void getArray() async {
    emotions = await frameInfo.getFrameInfo();
  }

  void compareEmotions() {
    int countswings = 0;
    var array = [];
    /*
    for(var index in emotions){
         (if emotions[index])
    }*/
    for (int i = 0; i < emotions.length; i++) {
      if (emotions[i] == positive[0] || emotions[i] == positive[1]) {
        array[i] = 0;
      } else if (emotions[i] == negative[0] ||
          emotions[i] == negative[1] ||
          emotions[i] == negative[2] ||
          emotions[i] == negative[3]) {
        array[i] = 1;
      } else if (emotions[i] == neutral[0] || emotions[i] == neutral[1]) {
        array[i] = 2;
      }
    }
    for (var index = 0; index <= array.length - 1; index++) {
      if (array[index] == 0 && array[index + 1] == 1) {
        countswings++;
      } else if (array[index] == 1 && array[index + 1] == 0) {
        countswings++;
      }
    }
  }
}
