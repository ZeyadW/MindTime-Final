import 'package:flutter/material.dart';
import 'package:medico/config/app_config.dart' as config;
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
            Navigator.of(context, rootNavigator: true).pop();
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
                              pressed = false;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                  child: Row(
                    children: [
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Container(
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
                            child: Text("Reject appointment",
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
