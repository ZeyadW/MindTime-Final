import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
//import 'package:medico/pages/Welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:medico/models/users.dart';

class Home extends StatefulWidget {
  final String value;
  const Home({Key key, this.value}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

var username;
var email;

class _HomeState extends State<Home> {
  Future<bool> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username');
    email = prefs.getString('email');
    print("username in get user" + username);
    return true;
  }

  _HomeState() {
    getUser();
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', null);
    prefs.setString('email', null);
    prefs.setBool('isLoggedIn', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 120,
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0)),
                    color: Theme.of(context).accentColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                            child: Center(
                              child: Text(
                                'MindTime',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.8),
                                ),
                              ),
                            ),
                          ),
                          Image(
                            image: AssetImage('images/MindTimeIconSize.png'),
                            width: 120,
                            height: 70,
                          ),

                          /* Text(
                            "${widget.value}",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),*/
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 100.0),
                  padding: const EdgeInsets.only(left: 15.0, right: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(150)),
                        onPressed: () async {
                          Navigator.of(context).pushNamed("/loaddoctors");
                        },
                        child: ball("images/nurse.png",
                            Theme.of(context).scaffoldBackgroundColor),
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(150)),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/journals');
                        },
                        child: ball("images/pill.png",
                            Theme.of(context).scaffoldBackgroundColor),
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(150)),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/knowledge');
                        },
                        child: ball("images/microscope.png",
                            Theme.of(context).scaffoldBackgroundColor),
                      ),
                      /*  FlatButton(
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(150)),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/tests');
                        },
                        child: ball("images/microscope.png",
                            Theme.of(context).scaffoldBackgroundColor),
                      ),*/
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
              padding: const EdgeInsets.only(left: 25, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Doctors",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).focusColor,
                        ),
                      ),
                      Text(
                        "Your doctors",
                        style: TextStyle(
                          fontSize: 10.0,
                          fontFamily: 'Poppins',
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Journals",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).focusColor,
                        ),
                      ),
                      Text(
                        "Add Journals",
                        style: TextStyle(
                          fontSize: 10.0,
                          fontFamily: 'Poppins',
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "KnowledgeHub",
                        style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).focusColor),
                      ),
                      Text(
                        "knowledge is power",
                        style: TextStyle(
                          fontSize: 10.0,
                          fontFamily: 'Poppins',
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  /*Column(
                    children: <Widget>[
                      Text(
                        "Tests",
                        style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).focusColor),
                      ),
                      Text(
                        "Answer tests",
                        style: TextStyle(
                          fontSize: 10.0,
                          fontFamily: 'Poppins',
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),*/
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 6, horizontal: 0),
              child: CarouselSlider(
                items: <Widget>[
                  Container(
                    height: 200.0,
                    margin: const EdgeInsets.only(left: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.0, color: Colors.grey.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.blueGrey[300],
                      /* image: DecorationImage(
                        //image: AssetImage('images/doctor-productivity.jpg'),
                        fit: BoxFit.cover,
                      ),*/
                    ),
                    child: Center(
                      child: TextButton(
                        child: Text(
                          "           Emotional \n    Regulation Test \n              ERQ",
                          style: TextStyle(
                              fontSize: 28.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/erql');
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 200.0,
                    margin: const EdgeInsets.only(left: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.0, color: Colors.grey.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.greenAccent,

                      /*image: DecorationImage(
                        // image: AssetImage('images/13nov_resize.jpg',),
                        fit: BoxFit.cover,
                      ),*/
                    ),
                    child: Center(
                      child: TextButton(
                        child: Text(
                          "        Brief Mood Introspection Scale \n            (BMIS)",
                          style: TextStyle(
                              fontSize: 28.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/bmis');
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 200.0,
                    margin: const EdgeInsets.only(left: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.0, color: Colors.grey.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.blue[300],
                    ),
                    child: Center(
                      child: TextButton(
                        child: Text(
                          "       Fear of \n  Abndonment \n          Test",
                          style: TextStyle(
                              fontSize: 28.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/foal');
                        },
                      ),
                    ),
                    /*   image: DecorationImage(
                        image: AssetImage(
                          'images/medical-lab-technician-85654102.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),*/
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Doctors',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).focusColor),
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      //await Navigator.of(context).pushNamed("/doctors");
                      await Navigator.of(context).pushNamed("/loaddoctors");
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 180.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  card("images/drsalma.jpg", "Dr.SALMA ABDELBAKI",
                      "B.Sc DDVL Demilitologist", "4.2"),
                  card("images/dradly.png", "Dr.ADLY EL SHEIKH",
                      "MBBCH, MSC, ABPSYCH PSYCHIATRIST ", "4.0"),
                  card("images/drhanadi.jpg", "Dr. HANADI ABDALLA",
                      "B.Sc DDVL Demilitologist ", "4.3"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ball(String image, Color color) {
    return Container(
      height: 80,
      width: 80.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Center(
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget ballcard(String image, Color color) {
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

  Widget card(String image, String title, String subTitle, String rank) {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  offset: Offset(0, 4),
                  blurRadius: 10)
            ],
          ),
          width: 140.0,
          height: 140.0,
          child: Card(
            elevation: 0.2,
            child: Wrap(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 40.0),
                  child: ListTile(
                    title: Text(
                      title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      children: <Widget>[
                        Text(
                          subTitle,
                          textAlign: TextAlign.left,
                          style:
                              TextStyle(fontFamily: 'Poppins', fontSize: 10.0),
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
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
          child: ballcard(image, Colors.transparent),
        ),
      ],
    );
  }
}
