import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medico/models/doctor.dart';
import 'package:medico/models/user.dart';

class Mypatientprofile extends StatefulWidget {
  const Mypatientprofile({
    Key key,
  }) : super(key: key);
  @override
  _MypatientprofileState createState() => _MypatientprofileState();
}

class _MypatientprofileState extends State<Mypatientprofile> {
  Doctor currentDoctor = new Doctor.init().getCurrentDoctor();
  User currentUser = new User.init().getCurrentUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            // Navigator.of(context).pushNamed('/home',arguments: [currentUser.name, currentUser.email]);
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 150,
                  padding:
                      const EdgeInsets.only(top: 40, left: 12.0, right: 12.0),
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
                      margin:
                          EdgeInsets.only(top: 33.0, left: 14.0, right: 14.0),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Prime",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    "4.0",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Emy Mohammed",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              Center(),
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
                    Center(
                        child: ball(
                      currentDoctor.avatar,
                      Theme.of(context).primaryColor,
                    )),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Description:",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 30.0,
                      child: Center(
                        child: Container(
                          height: 1.0,
                          color: Colors.grey[400].withOpacity(0.1),
                        ),
                      )),
                  Container(
                    child: Text(
                        'The patient suffers from fear of abandonment and extreme mood swings in addition to disturbnce in relationships'),
                  )
                ],
              ),
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
                RaisedButton(
                  elevation: 0,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {
                    // Navigator.of(context).pushNamed("/firstDoctorBook");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Theme.of(context).accentColor,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 75.0, right: 45.0, top: 12, bottom: 12),
                    child: Text(
                      'View shared diaries',
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
