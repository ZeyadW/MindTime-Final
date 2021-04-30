import 'package:flutter/material.dart';

class Himage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Row(
        children: [
          Image.asset(
            'images/icon.png',
            width: 350,
            height: 40,
          )
        ],
      ),
    );
  }
}
