import 'package:flutter/material.dart';
//import 'package:medico/models/appointments.dart' as model;
import 'package:medico/models/user.dart';
import 'package:medico/models/users.dart' as u;
//import 'package:medico/pages/AORAppointment.dart';
import 'package:medico/pages/viewappointments.dart';
//import 'package:medico/widgets/Journal/editjournal.dart';
//import 'package:medico/pages/JoinSession.dart';
//import 'package:medico/widgets/patientslistview.dart';

class PatientsWidget extends StatefulWidget {
  final u.Patient patient;

  const PatientsWidget({Key key, this.patient}) : super(key: key);

  @override
  _PatientsWidgetState createState() => _PatientsWidgetState();
}

class _PatientsWidgetState extends State<PatientsWidget> {
  bool pressed = false;
  final ZoomIDController = TextEditingController();
  final ZoomPasswordController = TextEditingController();
  User currentUser = new User.init().getCurrentUser();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Expanded(
            child: SizedBox(
              child: ListTile(
                onTap: () {},
                title: Expanded(
                  child: SizedBox(
                    child: Card(
                      elevation: 0.2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                offset: Offset(0, 4),
                                blurRadius: 10)
                          ],
                        ),
                        padding: const EdgeInsets.only(
                            top: 0.0, bottom: 0.0, left: 0.0, right: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            pressed
                                ? Expanded(
                                    child: SizedBox(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            child: TextFormField(
                                              controller: ZoomIDController,
                                              keyboardType:
                                                  TextInputType.number,
                                              autofocus: true,
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xff205072)),
                                              decoration: InputDecoration(
                                                  prefixIcon:
                                                      Icon(Icons.tab_outlined),
                                                  labelText: 'Zoom Meeting ID',
                                                  labelStyle: TextStyle(
                                                      color: const Color(
                                                          0xff205072)),
                                                  focusedBorder:
                                                      OutlineInputBorder(),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: const Color(
                                                            0xff205072)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            21.0),
                                                  )),
                                              validator: (value) {
                                                if (value.isEmpty ||
                                                    value == 0) {
                                                  return 'Please enter a number';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 10, 0, 0),
                                            child: Expanded(
                                              child: SizedBox(
                                                child: TextFormField(
                                                  controller:
                                                      ZoomPasswordController,
                                                  autofocus: true,
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0xff205072)),
                                                  decoration: InputDecoration(
                                                      prefixIcon: Icon(
                                                          Icons.tab_outlined),
                                                      labelText:
                                                          'Zoom Meeting Password',
                                                      labelStyle: TextStyle(
                                                          color: const Color(
                                                              0xff205072)),
                                                      focusedBorder:
                                                          OutlineInputBorder(),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: const Color(
                                                                0xff205072)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(21.0),
                                                      )),
                                                  validator: (value) {
                                                    if (value.isEmpty ||
                                                        value == 0) {
                                                      return 'Please enter a number';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: new EdgeInsets.symmetric(
                                                vertical: 20.0,
                                                horizontal: 10.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(21.0),
                                              gradient: RadialGradient(
                                                center: Alignment(-0.88, -1.0),
                                                radius: 1.35,
                                                colors: [
                                                  Colors.green,
                                                  Colors.green
                                                ],
                                                stops: [0.0, 1.0],
                                              ),
                                            ),
                                            child: FlatButton(
                                              child: Text("Accept Appointment",
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              onPressed: () {
                                                /*
                                                setState(() {
                                                  Navigator.push(
                                                      context,
                                                      new MaterialPageRoute(
                                                          builder: (context) =>
                                                              MeetingWidget(
                                                                  meetingId:
                                                                      ZoomIDController
                                                                          .text,
                                                                  meetingPassword:
                                                                      ZoomPasswordController
                                                                          .text)));

                                                  pressed = false;
                                                });*/
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : Row(
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          Container(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                '${widget.patient.username}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              Text(
                                                '${widget.patient.date}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              Text(
                                                '${widget.patient.time}',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          )),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 0, 0),
                                        child: Container(
                                          child: Row(
                                            children: [
                                              IconButton(
                                                padding: EdgeInsets.all(0),
                                                onPressed: () {
                                                  setState(() {
                                                    pressed = true;
                                                  });
                                                  //Navigator.of(context).pushNamed('/chat');
                                                },
                                                icon: Icon(Icons.thumb_up),
                                                iconSize: 20,
                                                color: Colors.green,
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        new MaterialPageRoute(
                                                            builder: (context) =>
                                                                ViewAppointments()));
                                                  },
                                                  icon: Icon(Icons.thumb_down),
                                                  color: Colors.red),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        //SizedBox(height: 20.0,child: Center(child: Container(height: 2.0,color: Colors.grey.withOpacity(0.1),),),),
      ],
    ));
  }
}
