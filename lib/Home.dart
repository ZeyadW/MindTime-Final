import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medico/pages/questionairescreen.dart';
import 'package:medico/pages/statsscreen.dart';
import 'package:medico/pages/viewjournals.dart';
import 'package:medico/widgets/stats/stat.dart';
import 'pages/viewjournals.dart';
import 'models/users.dart';
//import 'Screens/viewjournals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

var username;
var email;

class HomePage extends StatelessWidget {
  Future<bool> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username');
    email = prefs.getString('email');
  }

  void initState() {
    getUser();
  }

  User u = new User();
  HomePage.username({String username, String email, var phone}) {
    this.u.username = username;
    this.u.email = email;
    this.u.emergencycontact = phone;
    getUser();
  }
  HomePage.ut({this.u}) {
    getUser();
  }
  // HomePage.ul({this.user});
  HomePage() {
    getUser();
  }
  @override
  Widget build(BuildContext context) {
    print(u.emergencycontact);
    var row1 = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Container(
                width: 385.1,
                height: 250.2,
                decoration: BoxDecoration(
                  /*image: new DecorationImage(
                    image: new AssetImage("images/Avatar 3.png"),
                  ),*/
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(34.0),
                    bottomLeft: Radius.circular(34.0),
                  ),
                  color: Colors.blue[900],
                ),
                padding: new EdgeInsets.only(top: 30),
                child: Text(
                  '      Hello $username',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ))),
        Padding(padding: EdgeInsets.only(top: 50.0)),
      ],
    );
    var row2 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(image: AssetImage('images/Icons- brain.png')),
        Padding(padding: EdgeInsets.only(right: 7.0)),
        /*FlatButton(
          child: Text(
            'Therapists',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewTherapists()),
            );
          },
        ),*/
      ],
    );
    var row3 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(padding: EdgeInsets.only(top: 5.0)),
        Image(image: AssetImage('images/Icons- path.png')),
        Padding(padding: EdgeInsets.only(right: 7.0)),
        FlatButton(
          child: Text(
            'Journals',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewJournals()),
            );
          },
        ),
      ],
    );
    var row4 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(padding: EdgeInsets.only(top: 5.0)),
        Icon(
          Icons.pending_actions,
          color: Colors.blue[900],
          size: 40,
        ),
        Padding(padding: EdgeInsets.only(right: 7.0)),
        FlatButton(
          child: Text(
            'Assesments',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Questioanires()),
            );
          },
        ),
      ],
    );
    var row5 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(padding: EdgeInsets.only(top: 5.0)),
        Image(image: AssetImage('images/Icons- lab.png')),
        Padding(padding: EdgeInsets.only(right: 7.0)),
        FlatButton(
          child: Text(
            'Analysis',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Statscreen()),
            );
          },
        ),
      ],
    );
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                  title: Text('Home'),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage.ut(u: this.u)),
                      )),
              /*  ListTile(
                  title: Text('Profile'),
                 onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      )),
              ListTile(
                  title: Text('FAQ'),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchFaq()),
                      )),
              ListTile(
                  title: Text('Contact Us'),
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactUs()),
                      )),*/
            ],
          ),
        ),
        appBar: AppBar(
          title: Row(
            children: [
              Text('Home Page'),
              Container(
                margin: EdgeInsets.fromLTRB(100, 0, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21.0),
                  color: Colors.red[900],
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0x36329d9c),
                        offset: Offset(15, 15),
                        blurRadius: 40,
                        spreadRadius: 20),
                  ],
                ),
                child: FlatButton(
                  child: Text(
                    'SOS',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  onPressed: () {
                    launch("tel://${u.emergencycontact}");
                  },
                ),
              )
            ],
          ),
          backgroundColor: Colors.blue[900],
//            title: Center(child: Image(image: AssetImage('images/Icon.png'))),
        ),
        body: Center(
            child: Container(
          child: ListView(
              children: ListTile.divideTiles(
            context: context,
            tiles: [
              ListTile(
                title: row1,
              ),
              Divider(),
              ListTile(
                title: row2,
              ),
              ListTile(
                title: row3,
              ),
              Divider(),
              ListTile(
                title: row4,
              ),
              Divider(),
              ListTile(
                title: row5,
              ),
              Divider(),
            ],
          ).toList()),
        )));
  }
}
