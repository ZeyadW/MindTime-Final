import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medico/pages/AORAppointment.dart';
import 'package:medico/pages/addappointment.dart';
import 'package:medico/pages/editappointment.dart';
import 'package:medico/pages/viewappointmentsdoctor.dart';
import 'package:medico/models/appointments.dart';
import 'package:medico/widgets/PatientsWidget.dart';
import 'package:medico/widgets/mypatientswidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:medico/models/users.dart' as u;
import 'package:medico/config/app_config.dart' as config;

class MypatientListview extends StatefulWidget {
  @override
  _MypatientListviewState createState() => _MypatientListviewState();
}

class _MypatientListviewState extends State<MypatientListview> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = true;
  bool isSearch = false;
  u.PatientList patientList = new u.PatientList();
  @override
  void initState() {
    didnt();
  }

  var plist;
  Future<bool> waitp() async {
    print("beforeeeeeeeee wait dr");
    plist = await this.patientList.getarraypatients();
    setState(() {
      _isLoading = false;
    });
    if (plist != null) {
      print(plist.length);
      print(plist);
      print("Afterrrrrr await for doctors ");
      setState(() {
        _isLoading = false;
      });
      return true;
    } else {
      print("waitdr nulllllll");
      setState(() {
        _isLoading = true;
      });
      return false;
    }
  }

  void didnt() async {
    if (_isInit) {
      bool o = await waitp();
      if (o.toString() == "true") {
        setState(() {
          print("is loading false");
          _isLoading = false;
          print("length");
          print(plist.length);
          print(plist);
          //await waitdr();
        });
      }
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();

            //  Navigator.of(context).pushNamed('/home', arguments:[widget.currentUser.name]);
          },
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'My Patients',
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : alldoctors(),
    );
  }

  Widget alldoctors() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 20,
                padding: const EdgeInsets.only(top: 0, left: 12.0, right: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0)),
                  color: Theme.of(context).accentColor,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 0.0, left: 12.0, right: 12.0),
                // child: SearchBarWidget(),
              ),
              cards(),
            ],
          ),
        ],
      ),
    );
  }

  Widget cards() {
    print("card11");
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        primary: false,
        itemCount: plist.length,
        separatorBuilder: (context, index) {
          return SizedBox(height: 4.0);
        },
        itemBuilder: (context, index) {
          return cardss(
            plist.elementAt(index),
          );
        },
      ),
    );
  }

  Widget cardss(u.Patient patient) {
    print("cardssssssss");
    return Container(
      height: 170.0,
      padding: const EdgeInsets.all(6.0),
      child: FlatButton(
        highlightColor: Theme.of(context).primaryColor,
        onPressed: () async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('pname', patient.username);
          prefs.setString('pemail', patient.email);

          Navigator.of(context).pushNamed('/patientProfil');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Stack(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(26.0),
                  margin: EdgeInsets.only(top: 33.0, left: 14.0, right: 14.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          offset: Offset(2, 4),
                          blurRadius: 10)
                    ],
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '${patient.username}',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          Center(
                            child: Text(
                              '${patient.email}',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget ball(String image, Color color) {
    return Container(
      height: 60,
      width: 60.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100.0),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
