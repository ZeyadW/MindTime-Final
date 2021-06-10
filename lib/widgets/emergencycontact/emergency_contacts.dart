import 'package:flutter/material.dart';
import 'package:medico/models/emergencycontact.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Listemergencycontacts extends StatefulWidget {
  @override
  _Listemergencycontacts createState() {
    return _Listemergencycontacts();
  }
}

class _Listemergencycontacts extends State<Listemergencycontacts> {
  String email;

  Future<void> www() async {
    setEmail();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.email = prefs.getString('email');

    print(email);
  }

  void initState() {
    super.initState();
    setEmail();
  }

  Future<void> setEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.email = prefs.getString('email');
    setState(() {
      this.email = prefs.getString('email');
    });

    print(email);
  }

  Widget _buildBody(BuildContext context) {
    print('build body');
    print(email);
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Users')
          .doc(email)
          .collection('EmergecyContacts')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // print("empty snapshot");
          return LinearProgressIndicator();
        }
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
    print(data.data());
    print("o0000");
    final emergencyContact = Contact.fromSnapshot(data);

    return Center(
        child: new SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0)),
              // color: Colors.white,
              color: Theme.of(context).accentColor),
          child: ListTile(
            //  leading: Image(image: AssetImage('images/Icons- ambulance.jpeg')),
            trailing: IconButton(
              onPressed: () async {
                emergencyContact.deletecontact(emergencyContact.number);
              },
              icon: Icon(Icons.delete),
              //color: Colors.red,
            ),
            title: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
                child: FlatButton(
                  child: Text(emergencyContact.name,
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    /*Navigator.push(
                  context,
                 // MaterialPageRoute(builder: (context) => EditJournalM(diary)),
                );*/
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 120, 0),
                child: Text(
                  emergencyContact.number,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              )
            ]),
          )),
    )));
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Center(
        child: new SingleChildScrollView(
      child: Container(
        height: queryData.size.height - 200,
        width: queryData.size.width - 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34.0),
            topRight: Radius.circular(34.0),
            bottomRight: Radius.circular(34.0),
            bottomLeft: Radius.circular(34.0),
          ),
          //color: Colors.white,
          //color: Theme.of(context).accentColor,
        ),
        child: _buildBody(context),
      ),
    ));
  }
}
