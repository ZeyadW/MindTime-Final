import 'package:flutter/material.dart';
import 'package:medico/models/users.dart';
//import 'package:medico/pages/Loginn.dart';
//import 'package:medico/pages/Home.dart';
import 'package:medico/Service/FlutterFireauth.dart';
import 'package:medico/pages/admin/admin.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:medico/pages/home.dart';
import 'package:medico/pages/tabs.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  FocusNode myFocusNode;
  var _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
    myFocusNode = FocusNode();
  }

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  var username;
  final _formKey = GlobalKey<FormState>();
  static final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
  static final validCharactersPassword = RegExp(r'^[a-zA-Z0-9_\-=@\.;{6,}+$]');
  Users users = new Users();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  var u = new User();
  Future<bool> checkuserexist() async {
    this.u = await users.validatelogin(
        emailcontroller.text, passwordcontroller.text);
    print("in chekkkkkkk user ");
    print(u);
    if (u != null) {
      print("in  checkuser not null user");
      print(u.toString());
      print(u.username);
      username = u.username;
      return true;
    } else {
      print("in  checkuser null user");

      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text(
        "Ok",
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context, rootNavigator: true).pop();
        if (emailcontroller.text.contains("@mindtime.com")) {
        } else if (emailcontroller.text.contains("@mindtimeteam.com")) {
          //  return AdminPage();
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) => AdminPage()));
        } else {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) => TabsWidget(
                    acountInfos: [this.username],
                  )));
        }
        /*
        Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => TabsWidget(
                  acountInfos: [this.username],
                )));*/
        //Navigator.of(context).pushNamed('/home', arguments: [this.username]);

//        Navigator.of(context).push(new MaterialPageRoute(builder: (context) => Home()));
      },
    );

    Widget okButton2 = FlatButton(
      child: Text(
        "login again",
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        // Navigator.of(context).push(new MaterialPageRoute(builder: (context) => LoginPage()));
      },
    );
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.0),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x21329d9c),
                  offset: Offset(0, 13),
                  blurRadius: 34,
                ),
              ],
            ),
            child: TextFormField(
                controller: emailcontroller,
                autofocus: true,
                style: TextStyle(
                    fontFamily: "Montserrat-Medium",
                    color: Color.fromRGBO(32, 80, 114, 1)),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.perm_identity),
                    labelText: 'Enter your Email',
                    labelStyle: TextStyle(color: Theme.of(context).accentColor),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).accentColor)),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor),
                      borderRadius: BorderRadius.circular(21.0),
                    )),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (!value.contains('.')) {
                    return 'Please enter the correct email format';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter the correct email format';
                  }
                  return null;
                }),
          ),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.0),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x21329d9c),
                  offset: Offset(0, 13),
                  blurRadius: 34,
                ),
              ],
            ),
            child: TextFormField(
              controller: passwordcontroller,
              focusNode: myFocusNode,
              obscureText: !_passwordVisible,
              style: TextStyle(color: Theme.of(context).accentColor),
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  labelText: 'Enter your password',
                  labelStyle: TextStyle(color: Theme.of(context).accentColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).accentColor)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).accentColor),
                    borderRadius: BorderRadius.circular(21.0),
                  )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                if (!value.contains(validCharactersPassword)) {
                  return 'Please enter the correct format';
                }

                return null;
              },
            ),
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
          Container(
            //color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.0),
              gradient: new LinearGradient(
                  colors: [Theme.of(context).accentColor, Colors.blue[200]],
                  begin: const FractionalOffset(0.1, 1.0),
                  end: const FractionalOffset(0.8, 0.5),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
              boxShadow: [
                BoxShadow(
                    color: const Color(0xff000000),
                    offset: Offset(0, 13),
                    blurRadius: 15,
                    spreadRadius: -15.0),
              ],
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: FlatButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    print("waiting");
                    String shouldNavigate = await signIn(
                        emailcontroller.text, passwordcontroller.text);
                    print("done waiting");
                    var p = await checkuserexist();
                    print("check exist ");
                    print(p);
                    print(" shouldNavigate ");
                    print(shouldNavigate);
                    if (p == true &&
                        shouldNavigate == "Logged in successfully") {
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("Logged in successfully"),
                            actions: [okButton],
                          );
                        },
                      );
                    } else {
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(shouldNavigate),
                            actions: [okButton2],
                          );
                        },
                      );
                    }
                    // If the form is valid, display a Snackbar.

                  }
                },
                child: Text('Login'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
