import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medico/models/user.dart';

class AnalysisPage extends StatefulWidget {
  @override
  _AnalysisPageState createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  User currentUser = new User.init().getCurrentUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            /*  Navigator.of(context).pushNamed('/home',
                arguments: [currentUser.name, currentUser.email]);*/
          },
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'Borderline Symptoms Analysis',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: CarouselSlider(
            items: <Widget>[
              Card(
                elevation: 1,
                color: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(height: 80),
                      Container(
                        child: Text(
                          "Self Harm and Dangerous behavior. ",
                          style: TextStyle(
                              fontSize: 28.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "hey ",
                            style: TextStyle(
                              fontSize: 28.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.8),
                            ),
                          ),
                          Text(
                            "Read more",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 1,
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Container(
                  padding: EdgeInsets.all(12),
                  height: 400,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Monday 26th April",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.8),
                            ),
                          ),
                          Text(
                            "Wednsday 28th April",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 80),
                      Container(
                        child: Text(
                          "Brush up on hygiene . ",
                          style: TextStyle(
                              fontSize: 28.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 120),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.8),
                            ),
                          ),
                          Text(
                            "Read more",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 1,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Container(
                  padding: EdgeInsets.all(12),
                  height: 400,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Monday 26th April",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.8),
                            ),
                          ),
                          Text(
                            "Wednsday 28th April",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 80),
                      Container(
                        child: Text(
                          "Don't skip your breakfast . ",
                          style: TextStyle(
                              fontSize: 28.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 120),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.8),
                            ),
                          ),
                          Text(
                            "Read more",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
            height: 400,
          ),
        ),
      ),
    );
  }
}
