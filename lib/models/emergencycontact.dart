import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Contact {
  String name;
  String number;
  DocumentReference reference;

  Contact({name, number}) {
    this.name = name;
    this.number = number;
  }

  Contact.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['phone'] != null),
        name = map['name'],
        number = map['phone'];
  Contact.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Future<bool> addcontact(phonecontroller, namecontroller) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    print("emaiilll in addd contact ");
    print(email);
    await Firestore.instance
        .collection("Users")
        .doc(email)
        .collection('EmergecyContacts')
        .doc(phonecontroller.text)
        .set({
      'name': namecontroller.text,
      'phone': phonecontroller.text,
    });
    print("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu ");
    return true;
  }

  Future<bool> deletecontact(contact) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    await Firestore.instance
        .collection("Users")
        .doc(email)
        .collection('EmergecyContacts')
        .doc(contact)
        .delete();

    print("deleting record");
    return true;
  }
}
