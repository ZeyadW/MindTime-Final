import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:medico/pages/editjournal.dart';
import 'package:medico/models/doctoss.dart' as d;
import 'package:medico/widgets/admin/editdr.dart';
import 'package:medico/widgets/admin/editdrform.dart';
import 'package:medico/widgets/viewjournal/addjournalbuttonwidget.dart';

//import 'package:medico/widgets/viewjournal/addjournalbuttonwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListAllDoctors extends StatefulWidget {
  @override
  _ListAllDoctorsState createState() {
    return _ListAllDoctorsState();
  }
}

class _ListAllDoctorsState extends State<ListAllDoctors> {
  //var diary = new d.Diaries();
  var email;
  @override
  void initState() {
    super.initState();

    setEmail(); // calls getconnect method to check which type if connection it
  }

  Future<bool> deleteDoctor(username) async {
    //final SharedPreferences prefs = await SharedPreferences.getInstance();
    //this.email = prefs.getString('user');
    var email = username;
    await FirebaseFirestore.instance
        .collection("Therapists")
        .doc(email)
        .delete();
    return true;
  }

  Future<bool> setEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    setState(() {
      email = prefs.getString('email');
    });
    return true;
  }

  Future<void> getdoctordetails(docemail) async {
    try {
      print("kkkkk");
      DocumentSnapshot variable = await FirebaseFirestore.instance
          .collection('Therapists')
          .doc(docemail)
          .get();
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      print(email);
      print(variable);
      print(variable.data());
      var docname = prefs.setString('doctorname', variable.get('name'));

      var doclocation = prefs.setString('doctorloc', variable.get('location'));
      var docdesc = prefs.setString('doctordesc', variable.get('description'));
      var docpass = prefs.setString('doctorpass', variable.get('password'));

      var name = variable.get("name");
      print("variavle name" + name);
    } catch (e) {
      print("error in document snapshot "); //01061781950
      print(e);
    }
  }

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
          .orderBy('name', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final doctor = d.Doctors.fromSnapshot(data);
    return Center(
        child: new SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                decoration: new BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: new BorderRadius.all(
                      Radius.circular(40.0),
                    )),
                child: ListTile(
                  leading: Image(image: AssetImage('images/journl.jpeg')),
                  trailing: IconButton(
                      onPressed: () {
                        deleteDoctor(doctor.email);
                      },
                      icon: Icon(Icons.delete),
                      color: Colors.red),
                  title: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                      child: FlatButton(
                        child: Text(doctor.email),
                        onPressed: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          print("after shared pref");
                          // var docemail =
                          prefs.setString('doctoremail', doctor.email);
                          getdoctordetails(doctor.email);
                          print('edit therapist');
                          Navigator.push(
                            context, //*14# *888*4#
                            MaterialPageRoute(builder: (context) => Editdr()),
                          );
                        },
                      ),
                    ),
                  ]),
                ))));
  }
}
