import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medico/pages/AORAppointment.dart';
import 'package:medico/pages/addappointment.dart';
import 'package:medico/pages/editappointment.dart';
import 'package:medico/pages/viewappointmentsdoctor.dart';
import 'package:medico/models/appointments.dart';
import 'package:medico/widgets/appointmentsWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:medico/models/appointments.dart' as model;
import 'package:medico/config/app_config.dart' as config;

class AppointmentListviewDoctor extends StatefulWidget {
  @override
  _AppointmentListviewDoctorState createState() =>
      _AppointmentListviewDoctorState();
}

class _AppointmentListviewDoctorState extends State<AppointmentListviewDoctor> {
  model.ApointmentList appointmentList;
  @override
  void initState() {
    this.appointmentList = new model.ApointmentList();
    super.initState();

    setEmail(); // calls getconnect method to check which type if connection it
  }

  Future<bool> setEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    setState(() {
      email = prefs.getString('email');
    });
    return true;
  }

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  appointment r = new appointment();
  var email;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd hh:mm");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: new SingleChildScrollView(
          child: Container(
            width: 400,
            height: 475.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34.0),
                topRight: Radius.circular(34.0),
                bottomRight: Radius.circular(34.0),
                bottomLeft: Radius.circular(34.0),
              ),
              color: Colors.white,
            ),
            child: _buildBody(context),
          ),
        )),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34.0),
                topRight: Radius.circular(34.0),
                bottomRight: Radius.circular(34.0),
                bottomLeft: Radius.circular(34.0),
              ),
              color: Colors.white,
            ),
            child: FlatButton(
              height: 60,
              minWidth: 200,
              color: Colors.transparent,
              child: Text(
                '+ Appointment',
                style: TextStyle(
                    color: config.Colors().mainDarkColor(1),
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddAppointment()),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Therapists")
          .doc(email)
          .collection('Appointments')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildList(context, snapshot.data.docs);
        }

        return Container(
            child: Center(
          child: Text("No Appointments yet.."),
        ));
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final appoint = appointment.fromSnapshot(data);
    final appointdate =
        appoint.datecreated.toDate().difference(DateTime.now()).inHours.abs();
    var date = DateTime.fromMicrosecondsSinceEpoch(
        appoint.sessionDate.microsecondsSinceEpoch);
    String string = dateFormat.format(date);
    return Center(
        child: new SingleChildScrollView(
            child: Container(
      child: ListTile(
          title: AppointmentsWidget(
        appointment: appointmentList.appointment.elementAt(2),
        date: string,
      )),
    )));
  }
}
