import 'package:flutter/material.dart';
import 'package:medico/pages/addemergencycontact.dart';

class Addemergencybutton extends StatelessWidget {
/*
Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ContactProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ContactsPage(),
      ),
    );
  }
*/

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 850,
      height: 70,
      color: const Color(0xffe0ecde),
      margin: EdgeInsets.only(left: 0.0, top: 10.0, right: 0.0, bottom: 0.0),
      child: Row(children: [
        Text(
          'Emergency Contact:',
          style: TextStyle(
              fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            top: 10.0,
            right: 0.0,
            bottom: 0.0,
          ),
          child: FlatButton(
            child: Text(
              '+ Emergency Contact',
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
<<<<<<< HEAD
=======
              Navigator.of(context).pop();

>>>>>>> 11a3a2f5c2c50bfc6ef2791fb328644dfb29b473
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Addemergencycontactscreen()),
              );
            },
          ),
        )
      ]),
    );
  }
}
