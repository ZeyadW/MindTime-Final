import 'package:carousel_slider/carousel_slider.dart';
//import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:medico/models/user.dart';
import 'package:medico/widgets/assesmentsstat.dart';
import 'package:medico/widgets/line_chart_sample2.dart';
import 'package:medico/models/TextAnalysis.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HealthTips extends StatefulWidget {
  final List<String> acountInfos;

  const HealthTips({Key key, this.acountInfos}) : super(key: key);
  @override
  _HealthTipsState createState() => _HealthTipsState();
}

class _HealthTipsState extends State<HealthTips> {
  // User currentUser = new User.init().getCurrentUser();
  double selfharmper;
  double emptyper;
  double angerper;

  TotalTextAnalysis tt;
  void getsharedpref() async {
    await tt.getTextAnalysisDetails();
  }

  dynamic ch;
  @override
  void initState() {
    tt = new TotalTextAnalysis();
    getsharedpref();
    print(tt.angerper);
    //tt.getTextAnalysisDetails();
    ch = LineChartSample2();
  }

  var x = Colors.transparent;
  var y = Colors.white;
  @override
  Widget build(BuildContext context) {
    //Theme.of(context).primaryColor;
    var textself = Text(" ${tt.selfharmper} %",
        style: TextStyle(
          fontSize: 28.0,
          fontFamily: 'Poppins',
          color: x,
        ));
    var textempty = Text(" ${tt.emptyper} %",
        style: TextStyle(
          fontSize: 28.0,
          fontFamily: 'Poppins',
          color: x,
        ));
    var textanger = Text(" ${tt.angerper} %",
        style: TextStyle(
          fontSize: 28.0,
          fontFamily: 'Poppins',
          color: x,
        ));
    /* dynamic ch = Container(
      width: 20,
      height: 40,
    );*/
    dynamic chart = Container(
      child: ch,
      //color: x,
    );
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
            fontSize: 22.0,
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
                color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(height: 80),
                      Container(
                        child: TextButton(
                          child: Text(
                            "Self Harm and Dangerous behavior", //. ${tt.selfharmper} ",
                            style: TextStyle(
                                fontSize: 28.0,
                                fontFamily: 'Poppins',
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            setState(() {
                              x = Theme.of(context).primaryColor;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          textself,
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
                color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(height: 80),
                      Container(
                        child: TextButton(
                          child: Text(
                            "Feeling of Emptiness", //. ${tt.selfharmper} ",
                            style: TextStyle(
                                fontSize: 28.0,
                                fontFamily: 'Poppins',
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            setState(() {
                              x = Theme.of(context).primaryColor;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          textempty,
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
              SingleChildScrollView(
                child: Card(
                  elevation: 1,
                  color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 50),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Mood Analysis',
                          style: TextStyle(
                              fontSize: 28.0,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          child: Text(
                            "Tap to View Analysis",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Poppins',
                                color: y,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            setState(() {
                              y = Colors.transparent;

                              ch = LineChartSample2();
                              chart = LineChartSample2();
                            });
                          },
                        ),
                        LineChartSample2(),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 1,
                color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(height: 80),
                      Container(
                        child: TextButton(
                          child: Text(
                            "Extreme anger", //. ${tt.selfharmper} ",
                            style: TextStyle(
                                fontSize: 28.0,
                                fontFamily: 'Poppins',
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            setState(() {
                              x = Theme.of(context).primaryColor;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          textanger,
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
                color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'assesments Analysis',
                        style: TextStyle(
                            fontSize: 28.0,
                            fontFamily: 'Poppins',
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        child: Text(
                          "Tap to View Analysis",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Poppins',
                              color: y,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          setState(() {
                            getsharedpref();
                            y = Colors.transparent;

                            ch = PieChartSample2();
                            chart = PieChartSample2();
                          });
                        },
                      ),
                      PieChartSample2(),
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
