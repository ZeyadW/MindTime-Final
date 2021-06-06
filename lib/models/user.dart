import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String id = UniqueKey().toString();
  String name;
  String email;
  String gender;
  DateTime dateOfBirth;
  String avatar;

  User.init();

  User.basic(this.name, this.email);

  User.advanced(
      this.name, this.gender, this.dateOfBirth, this.avatar, this.email);

  Future<void> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.name = prefs.getString('username');
    this.email = prefs.getString('email');
  }

  User getCurrentUser() {
    getUser();
    return User.basic(this.name, this.email);
  }

  getDateOfBirth() {
    // return DateFormat('yyyy-MM-dd').format(this.dateOfBirth);
  }
}
