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
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Doctors"),
                Tab(text: "Assesments"),
                Tab(text: "Knowledge Hub"),
                Tab(
                  text: "Log out",
                  /* child: FlatButton(
                      child: Text("LOG"),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/logout');
                      },
                    )*/
                ),
              ],
            ),
            title: Text('Tabs '),
          ),
          body: TabBarView(
            children: [
              Admindoc(),
              Icon(Icons.directions_bike),
              AdminvideoUpload(),
              IconButton(
                onPressed: () async {
                  Navigator.of(context).pushNamed('/logout');
                },
                icon: Icon(Icons.delete),
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
