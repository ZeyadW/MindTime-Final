import 'package:flutter/material.dart';
import 'package:medico/pages/home.dart';
//import 'Signup.dart';
import 'Loginn.dart';
import '../widgets/welcomescreen/welcometitlewidget.dart';
import '../widgets/welcomescreen/welcomesubtitletext.dart';
import '../widgets/welcomescreen/welcomeimage.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

Color gradientStart =
    Color.fromRGBO(9, 6, 116, 1.0); //Change start gradient color here
Color gradientEnd =
    Color.fromRGBO(18, 11, 232, 1.0); //Change end gradient color here

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        child: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Color.fromRGBO(9, 6, 116, 1.0),
                  Color.fromRGBO(18, 11, 232, 1.0)
                ],
                begin: const FractionalOffset(0.5, 0.0),
                end: const FractionalOffset(0.0, 0.5),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(children: [
            Himage(),
            TitleText(),
            SubtitleText(),
            Iimage(),
            Signinbutton(),
            Signuptext()
          ]),
        ),
      ),
    );
  }
}

class Iimage extends StatefulWidget {
  @override
  _IimageState createState() => _IimageState();
}

class _IimageState extends State<Iimage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 200).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(100, 20, 0, 30),
      child: Row(
        children: [
          Image.asset(
            'images/Doctor.png',
            width: animation.value,
            height: animation.value,
          )
        ],
      ),
    );
  }
}

class Signinbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(120, 0, 10, 0),
          width: 180,
          decoration: BoxDecoration(
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
                  color: const Color(0xff000000),
                  offset: Offset(0, 13),
                  blurRadius: 15,
                  spreadRadius: -10.0),
            ],
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text("Log in",
                style: TextStyle(
                  fontFamily: 'Montserrat-Bold',
                  fontSize: 13,
                  color: const Color(0xffffffff),
                )),
          ),
        )
      ],
    );
  }
}

class Signuptext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Do not have an account?',
            style: TextStyle(
              fontFamily: 'Montserrat-Medium',
              fontSize: 13,
              color: Colors.white,
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Text(
              "Sign Up",
              style: TextStyle(
                  fontFamily: 'Montserrat-Medium',
                  fontSize: 13,
                  color: Color.fromRGBO(176, 208, 255, 1)),
            ),
          ),
        ],
      ),
    );
  }
}
