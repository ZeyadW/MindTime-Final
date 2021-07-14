import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medico/models/doctor.dart';
import 'package:medico/models/user.dart';
import 'package:medico/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientAcount extends StatefulWidget {
  const PatientAcount({
    Key key,
  }) : super(key: key);
  @override
  _PatientAcountState createState() => _PatientAcountState();
}

class _PatientAcountState extends State<PatientAcount> {
  var pemail;
  var pname;
  var _isLoading = true;
  //var currentpatient = new Patient();
  //User currentUser = new User.init().getCurrentUser();

  Future<bool> getDocEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    pemail = prefs.getString('pemail');
    pname = prefs.getString('pname');
    if (pemail != null) {
      // currentpatient = await new Doctor.init().getCurrentDoctor(docemail);
      print("Hamada Email" + pemail);
      print("Hamada Name" + pname);

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
    getDocEmail();
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
            /*Navigator.of(context).pushNamed('/home',
                arguments: [currentUser.name, currentUser.email]);*/
          },
        ),
        title: Text(
          'Patient',
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 150,
                        padding: const EdgeInsets.only(
                            top: 40, left: 12.0, right: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25.0),
                              bottomRight: Radius.circular(25.0)),
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(26.0),
                            margin: EdgeInsets.only(
                                top: 33.0, left: 14.0, right: 14.0),
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
                                      pname,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        pemail,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                          Center(),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(26.0),
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                        top: 30.0, left: 14.0, right: 14.0, bottom: 30),
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
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Shared Diaries',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        RaisedButton(
                          elevation: 0,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed("/viewjournalspatient");
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Theme.of(context).accentColor,
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 55.0, right: 55.0, top: 12, bottom: 12),
                            child: Text(
                              'View',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12.0,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(26.0),
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                        top: 30.0, left: 14.0, right: 14.0, bottom: 30),
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
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Analysis',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        RaisedButton(
                          elevation: 0,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onPressed: () {
                            Navigator.of(context).pushNamed("/health");
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Theme.of(context).accentColor,
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 55.0, right: 55.0, top: 12, bottom: 12),
                            child: Text(
                              'View',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12.0,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(26.0),
                    width: double.maxFinite,
                    margin: EdgeInsets.only(
                        top: 30.0, left: 14.0, right: 14.0, bottom: 30),
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
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Session Notes',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        RaisedButton(
                          elevation: 0,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onPressed: () {
                            // Navigator.of(context).pushNamed("/health");
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          color: Theme.of(context).accentColor,
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 55.0, right: 55.0, top: 12, bottom: 12),
                            child: Text(
                              'View',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12.0,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget ball(
    String image,
    Color color,
  ) {
    return Container(
      height: 60,
      width: 60.0,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          )),
    );
  }

  Widget card(String image, String title, String subTitle, String rank) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ball(image, Colors.transparent),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
              ),
              Text(
                subTitle,
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 10.0),
              ),
              Text(
                "50 \$",
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 10.0),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text(
                rank,
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
