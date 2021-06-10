//import 'dart:html';
//import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextAnalysis {
  String selfharm;
  String emptiness;
  String anger;
  TextAnalysis(l) {
    this.anger = l[0];
    this.selfharm = l[1];
    this.emptiness = l[2];
    /*print("anger");
    print(this.anger);
    print("selfahrm");
    print(this.selfharm);
    print("emptyy");
    print(this.emptiness);*/
  }
  String getselfharm() {
    return this.selfharm;
  }

  String getanger() {
    return this.anger;
  }

  String getemptiness() {
    return this.emptiness;
  }
  //this.anger, this.selfharm, this.emptiness);
}

class TotalTextAnalysis {
  List<TextAnalysis> textAnalysisArray = [];

  void getAnalysisfromDB(email) async {
    try {
      print("emaillll");

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(email)
          .collection("DiaryModelOutput")
          .get();
      List modelarray = querySnapshot.docs.map((doc) => doc.data()).toList();
      print(modelarray);
      modelarray.forEach((element) {
        print("hhhhhlllll");
        print(element.values);
        textAnalysisArray.add(TextAnalysis(element.values.toList()));
      });

      print(textAnalysisArray);
      analyseEmotions();
    } catch (e) {
      print("in catch get analysis" + e);
      //  return false;
    }
  }

  double selfharmper; //= (selfharmcount / length) * 100;
  double angerper; //= (angercount / length) * 100;
  double emptyper; //= (emptinesscount / length) * 100;
  void analyseEmotions() {
    int selfharmcount = 0;
    int emptinesscount = 0;
    int angercount = 0;
    int length = textAnalysisArray.length;

    for (int i = 0; i < length; i++) {
      if (textAnalysisArray[i].getanger() == "Anger") {
        angercount++;
      }
      if (textAnalysisArray[i].getselfharm() == "SelfHarm") {
        selfharmcount++;
      }
      if (textAnalysisArray[i].getemptiness() == "Empty") {
        emptinesscount++;
      }
    }
    selfharmper = (selfharmcount / length) * 100;
    angerper = (angercount / length) * 100;
    emptyper = (emptinesscount / length) * 100;

    print("Self Harm " + selfharmper.toString());
    print("Anger " + angerper.toString());
    print("Empty " + emptyper.toString());
    setAnalysisDetails();
  }

  void setAnalysisDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('selfharmper', this.selfharmper);
    prefs.setDouble('angerper', this.angerper);
    prefs.setDouble('emptyper', this.emptyper);
    print("anger in text moidellllllll:" +
        this.selfharmper.toString() +
        "selfharm:" +
        this.angerper.toString() +
        "empty:" +
        this.emptyper.toString());
  }

  void getTextAnalysisDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.selfharmper = prefs.getDouble("selfharmper");
    this.angerper = prefs.getDouble("angerper");
    this.emptyper = prefs.getDouble("emptyper");
    print("anger in fgetttt modellll:" +
        angerper.toString() +
        "selfharm:" +
        selfharmper.toString() +
        "empty:" +
        emptyper.toString());
  }
  /* void awaittext(email) async {
    print("in await");
    //bool tt =
    await getAnalysisfromDB(email);
    print("b3d await ");
    //print(tt);
  }*/
}
