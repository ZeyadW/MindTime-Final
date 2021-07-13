import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medico/pages/admin/adminaddvideo.dart';
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
                Tab(text: "Knowledge Hub"),
                Tab(
                  text: "Log out",
                ),
              ],
            ),
            title: Text('Tabs '),
          ),
          body: TabBarView(
            children: [
              Admindoc(),
              AdminvideoUpload(),
              TextButton(
                child: Text("Logout"),
                onPressed: () async {
                  Navigator.of(context).pushNamed('/logout');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
