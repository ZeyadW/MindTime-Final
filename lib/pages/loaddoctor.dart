import 'package:flutter/material.dart';
import 'package:medico/models/doctor.dart';
import 'package:medico/pages/doctors.dart';

import 'package:provider/provider.dart';

import 'package:medico/models/doctor.dart' as model;
import 'package:medico/models/user.dart';
import 'package:medico/widgets/doctorsWidget.dart';
import 'package:medico/widgets/searchWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loaddoctors extends StatefulWidget {
  @override
  _LoaddoctorsState createState() => _LoaddoctorsState();
}

class _LoaddoctorsState extends State<Loaddoctors> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = true;
  bool isSearch = false;
  model.DoctorsList doctorsList;
  @override
  void initState() {
    this.doctorsList = new model.DoctorsList();
    didChangeDependencies();
  }

  var drlist;
  Future<bool> waitdr() async {
    print("beforeeeeeeeee wait dr");
    drlist = await this.doctorsList.getarraydoctors();
    if (drlist != null) {
      print(drlist.length);
      print(drlist);
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

  void didChangeDependencies() async {
    if (_isInit) {
      bool o = await waitdr();
      if (o.toString() == "true") {
        setState(() {
          print("is loading false");
          _isLoading = false;
          print("length");
          print(drlist.length);
          print(drlist);
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
          'Doctors',
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
                child: SearchBarWidget(),
              ),
              cards(),
            ],
          ),
        ],
      ),
    );
  }
/*
  Future<String> callAsyncFetch() =>
      Future.delayed(Duration(seconds: 10), () => "hiiii");
  Widget hh() {
    print("gwa wait");
    callAsyncFetch().then((value) => cards());
    print("bara waitt");
    / print("gwa wait");
    waitdr().then((data) {
      return cards(); // doesn't work
    });/
  }*/

  Widget cards() {
    print("card11");
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        primary: false,
        itemCount: drlist.length,
        separatorBuilder: (context, index) {
          return SizedBox(height: 4.0);
        },
        itemBuilder: (context, index) {
          return cardss(
            drlist.elementAt(index),
          );
        },
      ),
    );
  }

  Widget cardss(Doctor doctors) {
    print("cardssssssss");
    return Container(
      height: 150.0,
      padding: const EdgeInsets.all(6.0),
      child: FlatButton(
        highlightColor: Theme.of(context).primaryColor,
        onPressed: () async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('docname', doctors.name);
          print("doctor name:" + doctors.name);
          Navigator.of(context).pushNamed('/doctorProfil');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Card(
          elevation: 0.2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: Offset(0, 4),
                    blurRadius: 10)
              ],
            ),
            padding: const EdgeInsets.only(
                top: 12.0, bottom: 12.0, left: 12.0, right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // ball(widget.doctors.avatar, Colors.transparent),
                    Text(
                      '${doctors.state}',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12.0,
                        color: doctors.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 6.0),
                          child: Text(
                            '${doctors.name}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: 160.0,
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: Colors.grey.withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${doctors.description}',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey,
                                fontSize: 10.0),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '9:30AM - 8:00PM',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
