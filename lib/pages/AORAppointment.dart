import 'package:flutter/material.dart';
import 'package:medico/config/app_config.dart' as config;
import 'package:medico/pages/JoinSession.dart';
import 'package:medico/pages/editappointment.dart';
import 'package:medico/pages/viewappointments.dart';

void main() => runApp(MaterialApp(
      home: AORAppointment(),
    ));

class AORAppointment extends StatefulWidget {
  @override
  AORAppointmentState createState() {
    return new AORAppointmentState();
  }
}

class AORAppointmentState extends State<AORAppointment> {
  bool pressed = false;
  final ZoomIDController = TextEditingController();
  final ZoomPasswordController = TextEditingController();

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
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => ViewAppointments()));
            /*
            Navigator.of(context).pushNamed('/home',
                arguments: [widget.currentUser.name, widget.currentUser.email]);*/
          },
        ),
        backgroundColor: config.Colors().mainDarkColor(1),
        title: Text(
          'Appointments',
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          pressed
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: ZoomIDController,
                        keyboardType: TextInputType.number,
                        autofocus: true,
                        style: TextStyle(color: const Color(0xff205072)),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.tab_outlined),
                            labelText: 'Zoom Meeting ID',
                            labelStyle:
                                TextStyle(color: const Color(0xff205072)),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: const Color(0xff205072)),
                              borderRadius: BorderRadius.circular(21.0),
                            )),
                        validator: (value) {
                          if (value.isEmpty || value == 0) {
                            return 'Please enter a number';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: TextFormField(
                          controller: ZoomPasswordController,
                          autofocus: true,
                          style: TextStyle(color: const Color(0xff205072)),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.tab_outlined),
                              labelText: 'Zoom Meeting Password',
                              labelStyle:
                                  TextStyle(color: const Color(0xff205072)),
                              focusedBorder: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: const Color(0xff205072)),
                                borderRadius: BorderRadius.circular(21.0),
                              )),
                          validator: (value) {
                            if (value.isEmpty || value == 0) {
                              return 'Please enter a number';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: new EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21.0),
                          gradient: RadialGradient(
                            center: Alignment(-0.88, -1.0),
                            radius: 1.35,
                            colors: [Colors.green, Colors.green],
                            stops: [0.0, 1.0],
                          ),
                        ),
                        child: FlatButton(
                          child: Text("Accept Appointment",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => MeetingWidget(
                                          meetingId: ZoomIDController.text,
                                          meetingPassword:
                                              ZoomPasswordController.text)));

                              pressed = false;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                )
              : Column(
                  children: [
                    Center(
                      child: Container(
                        height: 450,
                        width: 350,
                        margin: EdgeInsets.only(top: 100),
                        padding: EdgeInsets.only(
                            top: 0, right: 20, left: 20, bottom: 20),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              spreadRadius: 5,
                              blurRadius: 20,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),
                              topLeft: Radius.circular(30.0)),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.97,
                                height: 120,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30.0),
                                      bottomRight: Radius.circular(30.0),
                                      bottomLeft: Radius.circular(30.0),
                                      topLeft: Radius.circular(30.0)),
                                  color: config.Colors().mainDarkColor(1),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: Column(
                                      children: [
                                        Text("Patient Name: Zeyad",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            )),
                                        Text("Session Date: 6-9-2021",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            )),
                                        Text("Session Time: 6:30 PM",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 50, 0, 0),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21.0),
                                      gradient: RadialGradient(
                                        radius: 1.35,
                                        colors: [Colors.green, Colors.green],
                                        stops: [0.0, 1.0],
                                      ),
                                    ),
                                    child: FlatButton(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Text(
                                        "Accept appointment",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          pressed = true;
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: new EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21.0),
                                      gradient: RadialGradient(
                                        center: Alignment(-0.88, -1.0),
                                        radius: 1.35,
                                        colors: [Colors.red, Colors.red],
                                        stops: [0.0, 1.0],
                                      ),
                                    ),
                                    child: FlatButton(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Text("Reject appointment",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewAppointments()));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
