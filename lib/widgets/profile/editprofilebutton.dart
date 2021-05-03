import 'package:flutter/material.dart';
import 'package:medico/pages/EditProfile.dart';

class Editprofilebutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.0),
        gradient: new LinearGradient(
            colors: [
              Color.fromRGBO(18, 11, 232, 1.0),
              Color.fromRGBO(107, 164, 249, 1.0)
            ],
            begin: const FractionalOffset(0.1, 1.0),
            end: const FractionalOffset(0.8, 0.5),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
        boxShadow: [
          BoxShadow(
            color: const Color(0x36329d9c),
            offset: Offset(15, 15),
            blurRadius: 40,
          ),
        ],
      ),
      child: FlatButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfilePage()),
          );
        },
        child: Text(
          "Edit Profile",
        ),
      ),
    );
  }
}
