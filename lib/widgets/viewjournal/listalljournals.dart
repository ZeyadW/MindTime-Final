import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medico/pages/editjournal.dart';
import 'package:medico/models/diaries.dart' as d;
//import 'package:medico/widgets/viewjournal/addjournalbuttonwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListAllJournals extends StatefulWidget {
  @override
  _ListAllJournalState createState() {
    return _ListAllJournalState();
  }
}

class _ListAllJournalState extends State<ListAllJournals> {
  var diary = new d.Diaries();
  var email;
  @override
  void initState() {
    super.initState();

    setEmail(); // calls getconnect method to check which type if connection it
  }

  Future<bool> deleteDiary(diary) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    this.email = prefs.getString('email');
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(email)
        .collection('Diary')
        .doc(diary.title)
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
          .collection("Users")
          .doc(email)
          .collection('Diary')
          .orderBy('title', descending: true)
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
    final diary = d.Diaries.fromSnapshot(data);
    final diarydate =
        diary.timestamp.toDate().difference(DateTime.now()).inDays.abs();
    return Center(
        child: new SingleChildScrollView(
            child: Container(
                child: ListTile(
      leading: Image(image: AssetImage('images/journl.jpeg')),
      trailing: IconButton(
          onPressed: () {
            deleteDiary(diary);
          },
          icon: Icon(Icons.delete),
          color: Colors.red),
      title: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
          child: FlatButton(
            child: Text(diary.title),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditJournalM(diary)),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 120, 0),
          child: Text(
            'Added $diarydate Days Ago',
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.normal),
          ),
        )
      ]),
    ))));
  }
}
