import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medico/pages/admin/admindoc.dart';
//import 'package:medico/widgets/admin/doctors.dart';
//import 'package:medico/widgets/viewjournal/listalljournals.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Doctors"),
                Tab(text: "Assesments"),
                Tab(text: "Knowledge Hub"),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              Admindoc(),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
