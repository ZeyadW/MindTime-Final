import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medico/pages/editappointment.dart';
import 'package:medico/pages/viewappointments.dart';
import 'package:medico/models/appointments.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class AppointmentListview extends StatefulWidget {
  @override
  _AppointmentListviewState createState() => _AppointmentListviewState();
}

class _AppointmentListviewState extends State<AppointmentListview> {
  @override
  void initState() {
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
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Center(
        child: new SingleChildScrollView(
      child: Container(
        width: 385.1,
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
    ));
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
          child: Text("No Reminders yet.."),
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
        appoint.SessionDate.microsecondsSinceEpoch);
    String string = dateFormat.format(date);
    return Center(
        child: new SingleChildScrollView(
            child: Container(
                child: ListTile(
      trailing: IconButton(
        onPressed: () {
          appoint.DeleteAppointment(data, appoint.appointmentID);
        },
        icon: Icon(Icons.delete),
        color: Colors.red,
      ),
      title: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
          child: FlatButton(
            child: Text('Appointment ' + string),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ViewAppointment(appoint)),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 120, 0),
          child: Text(
            'Added $appointdate hrs Ago',
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.normal),
          ),
        )
      ]),
    ))));
  }
/*
  @override
  Widget build(BuildContext context) {
    var rname;
    print("sjghsjkf $email");
    return Container(
        width: 385.1,
        height: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34.0),
            topRight: Radius.circular(34.0),
            bottomRight: Radius.circular(34.0),
            bottomLeft: Radius.circular(34.0),
          ),
          color: Colors.white,
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(email)
              .collection("Reminders")
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data.docs.map((snap) {
                  final reminder = Reminder.fromSnapshot(snap);
                  rname = reminder.remindername;
                  print(reminder.courseStrt.toDate());
                  final rdate = reminder.datecreated
                      .toDate()
                      .difference(DateTime.now())
                      .inHours;
                  final rtype = reminder.type.toString().toLowerCase();
                  final rid = snap.id;

                  return ListTile(
                    title: Text(rname ?? "no data"),
                    leading:
                        Image(image: AssetImage('images/Icons-$rtype.png')),
                    onTap: () {
                      print(rid);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewReminder(reminder, rid)),
                      );
                    },
                    subtitle: Text(
                      'in $rdate hrs',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.black),
                      hoverColor: Colors.red,
                      onPressed: () {
                        r.deletereminder(snap, rname);
                      },
                    ),
                  );
                }).toList(),
              );
            }
            return Container(
                child: Center(
              child: Text("No Reminders yet.."),
            ));
          },
        ));
  }*/
}
