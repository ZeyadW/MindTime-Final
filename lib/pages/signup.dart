import 'package:flutter/material.dart';
import 'package:medico/models/user.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static const IconData account_circle_outlined =
      IconData(0xee35, fontFamily: 'MaterialIcons');
  User currentUser = new User.init().getCurrentUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 375.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0)),
              image: DecorationImage(
                image: AssetImage('images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
                color: Theme.of(context).accentColor.withOpacity(0.8),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50.0, right: 50.0, left: 50.0),
            height: 50,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).focusColor.withOpacity(0.2),
                    offset: Offset(0, 4),
                    blurRadius: 20)
              ],
            ),
            child: RaisedButton(
              elevation: 0.2,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.login),
                      Text(
                        ' Login',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).focusColor,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, right: 50.0, left: 50.0),
            height: 50,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context).focusColor.withOpacity(0.2),
                    offset: Offset(0, 4),
                    blurRadius: 20)
              ],
            ),
            child: RaisedButton(
              elevation: 0.2,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  "/createaccount",
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.create),
                      Text(
                        ' SignUp',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).focusColor,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Center(
              child: Text(
                "By continuing, you agree to Terms & Conditions",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
