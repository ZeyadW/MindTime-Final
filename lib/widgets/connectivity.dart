//import 'package:connectivity/connectivity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:medico/pages/Welcome.dart';
import 'package:medico/pages/home.dart';

=======
import 'package:medico/Home.dart';
import 'package:medico/pages/welcomescreen%20(1).dart';
>>>>>>> 11a3a2f5c2c50bfc6ef2791fb328644dfb29b473
import 'package:shared_preferences/shared_preferences.dart';

/*
class HomeConnect extends StatefulWidget {
  @override
  _HomeConnectState createState() => _HomeConnectState();
}

class _HomeConnectState extends State<HomeConnect> {
  var wifiBSSID;
  var wifiIP;
  var wifiName;
  bool iswificonnected = false;
  bool isInternetOn = true;
  @override
  void initState() {
    super.initState();

    getConnect(); // calls getconnect method to check which type if connection it
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isInternetOn ? AutoLogin() : buildAlertDialog(),
      //  body: isInternetOn
        //  ? iswificonnected
          //    ? showWifi()
            //  : showMobile()
        //  : buildAlertDialog(),
    );
  }

  AlertDialog buildAlertDialog() {
    return AlertDialog(
      title: Text(
        "You are not Connected to Internet",
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    );
  }

  Center showWifi() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              " Your are connected to ${iswificonnected ? "WIFI" : "MOBILE DATA"}"),
          Text(iswificonnected ? "$wifiBSSID" : "Not Wifi"),
          Text("$wifiIP"),
          Text("$wifiName")
        ],
      ),
    );
  }

  Center showMobile() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(" Your are Connected to  MOBILE DATA"),
        ],
      ),
    );
  }

  void getConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isInternetOn = false;
      });
    } else if (connectivityResult == ConnectivityResult.mobile) {
      iswificonnected = false;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      iswificonnected = true;
    }
  }
}
*/
class AutoLogin extends StatefulWidget {
  @override
  _AutoLogin createState() => _AutoLogin();
}

class _AutoLogin extends State<AutoLogin> {
  TextEditingController nameController = TextEditingController();

  bool isLoggedIn = false;
  String name = '';
  String email = '';
  var phone;
  var countv;
  String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
        body: !isLoggedIn
            ? Welcome()
            : Home() // HomePage.username(username: userId, email: email, phone: phone),
        );
=======
      body: !isLoggedIn
          ? WelcomeScreen()
          : HomePage.username(username: userId, email: email, phone: phone),
    );
>>>>>>> 11a3a2f5c2c50bfc6ef2791fb328644dfb29b473
  }

  @override
  void initState() {
    super.initState();
    countVideos();
    autoLogIn();
  }

  Future<void> countVideos() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    FirebaseFirestore.instance
        .collection("Users")
        .doc(email)
        .collection('videos')
        .get()
        .then((myDocuments) {
      print('getCountV');
      this.countv = prefs.setInt('countV', myDocuments.docs.length);
    });
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.userId = prefs.getString('username');
    this.email = prefs.getString('email');
    this.phone = prefs.getString('emergencyphone');
    this.countv = prefs.getInt('countV');
    this.isLoggedIn = prefs.getBool('isLoggedIn');
    print('autologin');
    print(countv);
    print(email);
    if (userId != null) {
      setState(() {
        prefs.setBool('isLoggedIn', true);

        isLoggedIn = true;
        name = userId;
      });
      return;
    }
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', null);
    prefs.setString('email', null);
    prefs.setBool('isLoggedIn', false);
    this.isLoggedIn = false;
    setState(() {
      name = '';
      isLoggedIn = false;
    });
  }

  Future<Null> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', nameController.text);

    setState(() {
      name = nameController.text;
      isLoggedIn = true;
    });

    nameController.clear();
  }
}
