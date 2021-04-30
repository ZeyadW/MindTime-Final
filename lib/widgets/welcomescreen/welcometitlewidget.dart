import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'This is MindTime,\f       Welcome!',
            style: TextStyle(
              fontFamily: 'Lato-Bold',
              fontSize: 21,
              color: const Color(0xffffffff),
            ),
          ),
        ],
      ),
    );
  }
}
