import 'package:flutter/material.dart';
import 'package:medico/models/TextAnalysis.dart';
//import 'package:medico/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AcountWidget extends StatefulWidget {
  final List<String> acountInfos;

  const AcountWidget({Key key, this.acountInfos}) : super(key: key);
  @override
  _AcountWidgetState createState() => _AcountWidgetState();
}

Future<Null> logout() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('username', null);
  prefs.setString('email', null);
  prefs.setBool('isLoggedIn', false);
}

class _AcountWidgetState extends State<AcountWidget> {
  // User currentUser = new User.init().getCurrentUser();
  //User currentUser = new User.basic("name", "email");
  TotalTextAnalysis text;
  void awaittext(email) async {
    print("in await");
    await text.getAnalysisfromDB(email);
    print("b3d await ");
  }

  @override
  void initState() {
    text = new TotalTextAnalysis();
    print(widget.acountInfos[0]);
    print("init state of health page");
    print(widget.acountInfos[1]);
    text.getAnalysisfromDB(widget.acountInfos[1]);
    //text.getAnalysisfromDB(currentUser.email);
    // awaittext(currentUser.email);
  }

  @override
  Widget build(BuildContext context) {
    // String name = currentUser.getusername();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 280.0,
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.only(top: 40.0, left: 12.0, right: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Theme.of(context).accentColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.perm_identity,
                      size: 25, color: Theme.of(context).primaryColor),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //  ball("images/imageuser.png", Colors.transparent),
                      Column(
                        children: <Widget>[
                          SizedBox(height: 50),
                          Text(
                            "${widget.acountInfos[0]}",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${widget.acountInfos[1]}",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Text(
                        "25%",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Theme.of(context).primaryColor,
                            ),
                            width: 70,
                            height: 4,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.indigo,
                              ),
                              height: 4,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          onPressed: () {
                            Navigator.of(context).pushNamed('/editprofile');
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Container(
                            child: Center(
                              child: Text(
                                'Edit your profile',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.settings,
                      size: 25.0,
                      color: Theme.of(context).primaryColor,
                    ))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              children: <Widget>[
                _dropDownListe(
                    Icon(
                      Icons.bubble_chart,
                      color: Theme.of(context).accentColor,
                    ),
                    'My Doctors',
                    1,
                    '/mydoctors',
                    context),
                _dropDownListe(
                    Icon(
                      Icons.calendar_today,
                      color: Theme.of(context).accentColor,
                    ),
                    'Appointments',
                    1,
                    '/appointment',
                    context),
                _dropDownListe(
                    Icon(
                      Icons.card_giftcard,
                      color: Theme.of(context).accentColor,
                    ),
                    'Health Interest',
                    1,
                    '/health',
                    context),
                _dropDownListe(
                    Icon(
                      Icons.analytics,
                      color: Theme.of(context).accentColor,
                    ),
                    'Analysis',
                    1,
                    '/analysispage',
                    context),
                /*  _dropDownListe(
                    Icon(
                      Icons.payment,
                      color: Theme.of(context).accentColor,
                    ),
                    'My Payments',
                    1,
                    '',
                    context),*/
                _dropDownListe(
                    Icon(
                      Icons.local_offer,
                      color: Theme.of(context).accentColor,
                    ),
                    'Emergency contacts',
                    1,
                    '/emerge',
                    context),
                _dropDownListe(
                    Icon(
                      Icons.arrow_upward,
                      color: Theme.of(context).accentColor,
                    ),
                    'Logout',
                    0,
                    '/logout',
                    context),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

Widget _dropDownListe(Icon icon, String title, double borderWidth, String route,
    BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
          bottom: BorderSide(
              width: borderWidth, color: Colors.grey.withOpacity(0.2))),
    ),
    child: FlatButton(
      onPressed: () {
        if (route == '/logout') {
          logout();
          Navigator.of(context).pushNamed(route);
        } else
          Navigator.of(context).pushNamed(route);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 25.0),
                child: icon,
              ),
              Container(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Icon(
              Icons.chevron_right,
              color: Colors.grey,
              size: 20,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget ball(String image, Color color) {
  return Container(
    height: 70,
    width: 70.0,
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
