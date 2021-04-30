import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Track your medications and get reminders,\npersonal diary, general health instructions',
          style: TextStyle(
            fontFamily: 'Montserrat-Medium',
            fontSize: 13,
            color: Color.fromRGBO(176, 208, 255, 1),
          ),
        ),
      ],
    );
  }
}
