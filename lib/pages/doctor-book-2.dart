import 'package:flutter/material.dart';
import 'package:medico/models/doctor.dart';
import 'package:medico/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorBookSecondeStep extends StatefulWidget {
  @override
  _DoctorBookSecondeStepState createState() => _DoctorBookSecondeStepState();
}

class _DoctorBookSecondeStepState extends State<DoctorBookSecondeStep> {
  var currentDoctor = new Doctor.init();
  var docemail;
  var docname;
  bool _isLoading = true;
  Future<bool> getDoctorsEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    docemail = prefs.getString('docemail');
    if (docemail != null) {
      currentDoctor = await new Doctor.init().getCurrentDoctor(docemail);
      print("Hamada Email" + currentDoctor.email);
      print("Hamada Name" + currentDoctor.name);

      setState(() {
        _isLoading = false;
      });
      return true;
    } else {
      setState(() {
        _isLoading = true;
      });
      return false;
    }
  }

  @override
  void initState() {
    print("initttttttttt");
    super.initState();
    getDoctorsEmail();
    //waitt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () {
            //  Navigator.of(context).pushNamed('/firstDoctorBook');
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'Select a time slot',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 40,
                  padding:
                      const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0)),
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 20.0, right: 12.0, left: 12.0, bottom: 12.0),
                  margin: EdgeInsets.only(
                      right: 12.0, left: 12.0, bottom: 12.0, top: 0),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          // ball(currentDoctor.avatar, Colors.transparent),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                currentDoctor.name,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Text(
                                  currentDoctor.description,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                        child: Center(
                          child: Container(
                            height: 2.0,
                            color: Colors.grey.withOpacity(0.1),
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "DATE & Time",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "15 July 4:45PM",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 60.0,
                              width: 2,
                              child: Center(
                                child: Container(
                                  height: 60.0,
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Consultation Fees",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "300 EGP",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                        child: Center(
                          child: Container(
                            height: 2.0,
                            color: Colors.grey.withOpacity(0.1),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        child: Text(
                          "By Booking this appointment you agree to the T&C",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
            padding:
                EdgeInsets.only(right: 0.0, left: 50.0, bottom: 0.0, top: 0),
            margin: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(width: 1, color: Colors.grey.withOpacity(0.6)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Give Feedback',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          color: Colors.grey),
                    ),
                  ],
                ),
                RaisedButton(
                  elevation: 0,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {
                    Navigator.of(context).pushNamed("/home", arguments: [
                      "currentDoctor.name",
                      " currentDoctor.email"
                    ]);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Theme.of(context).accentColor,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 55.0, right: 55.0, top: 12, bottom: 12),
                    child: Text(
                      'Book',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            )),
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
          )),
    );
  }
}
