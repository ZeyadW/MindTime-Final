import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
//import 'package:medico/models/users.dart';
import 'package:medico/pages/EditProfile.dart';
//import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EditProfileForm extends StatefulWidget {
  @override
  EditProfileFormState createState() {
    return EditProfileFormState();
  }
}

class EditProfileFormState extends State<EditProfileForm> {
  //EditProfileFormState();
  var email;
  var username;
  var _passwordVisible;
  FocusNode myFocusNode;
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
    myFocusNode = FocusNode();
  }

  void passwordicon() {
    setState(() {
      print("new password set state");
      _passwordVisible = !_passwordVisible;
    });
    // _passwordVisible = !_passwordVisible;
  }

  Future<bool> editProfile(usernamecontroller, selectedDate, passwordcontroller,
      newpasswordcontroller) async {
    Widget okButtonwrong = FlatButton(
      child: Text(
        "Ok",
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context).push(
            new MaterialPageRoute(builder: (context) => EditProfilePage()));
      },
    );
    Widget okButton = FlatButton(
      child: Text(
        "Ok",
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');

    DocumentSnapshot variable =
        await FirebaseFirestore.instance.collection('Users').doc(email).get();

    var passworduser = variable.get("password");
    print("passs");
    print(passworduser);
    print(passwordcontroller.text);
    print("new    passs");
    print(newpasswordcontroller.text);
    if (passworduser == passwordcontroller.text) {
      if (newpasswordcontroller.text == null) {
        print("new    passs");
        print(newpasswordcontroller.text);
        newpasswordcontroller.text = passwordcontroller.text;
      }
      try {
        await FirebaseFirestore.instance.collection("Users").doc(email).update({
          'birthdate': selectedDate,
          'password': newpasswordcontroller.text,
          'username': usernamecontroller.text,
        });
        prefs.setString('username', usernamecontroller.text);

        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Profile updated successfully"),
              actions: [okButton],
            );
          },
        );
      } catch (e) {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Something went wrong , try again " + e),
              actions: [okButtonwrong],
            );
          },
        );
      }
    }

    return true;
  }

  final _formKey = GlobalKey<FormState>();
  static final validCharactersPassword = RegExp(r'^[a-zA-Z0-9_\-=@\.;{6,}+$]');
  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd/MM/yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate;
    final usernamecontroller = TextEditingController(); //text: username);
    final passwordcontroller = TextEditingController();
    final newpasswordcontroller = TextEditingController();

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
              controller: usernamecontroller,
              autofocus: true,
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.perm_identity),
                  labelText: 'Enter your Name',
                  labelStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                  )),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                    borderRadius: BorderRadius.circular(21.0),
                  )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return "";
              },
            ),
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
            child: DateTimeFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.blue),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                suffixIcon: Icon(
                  Icons.event_note,
                  color: Colors.blue,
                ),
                labelText: 'Birth-Date',
                labelStyle: TextStyle(color: Colors.blue),
              ),
              mode: DateTimeFieldPickerMode.date,
              autovalidateMode: AutovalidateMode.always,
              validator: (e) =>
                  (e?.day ?? 0) == null ? 'choose an aproprite date.' : null,
              onDateSelected: (DateTime value) {
                print(value);
                selectedDate = value;
              },
            ),
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
              obscureText: !_passwordVisible,
              style: TextStyle(color: Colors.blue[900]),
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        print("set state ");
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.blue[900]),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue[900])),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue[900]),
                    borderRadius: BorderRadius.circular(21.0),
                  )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                if (!value.contains(validCharactersPassword)) {
                  return 'Please enter the correct format';
                }

                return "";
              },
            ),

            /*TextFormField(
              controller: passwordcontroller,
              obscureText: !_passwordVisible,
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  labelText: 'Old Password',
                  labelStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                  )),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                    borderRadius: BorderRadius.circular(21.0),
                  )),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),*/
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
              controller: newpasswordcontroller,
              obscureText: !_passwordVisible,
              style: TextStyle(color: Colors.blueAccent),
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      passwordicon();
                    },
                  ),
                  labelText: 'New Password',
                  labelStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                  )),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                    borderRadius: BorderRadius.circular(21.0),
                  )),
              validator: (value) {
                if (!value.contains(validCharactersPassword)) {
                  return 'Please enter the correct format';
                }
                return "";
              },
            ),
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21.0),
              gradient: new LinearGradient(
                  colors: [
                    Theme.of(context).accentColor,
                    Theme.of(context).accentColor
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
            child: Align(
              alignment: Alignment.topCenter,
              child: FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    editProfile(usernamecontroller, selectedDate,
                        passwordcontroller, newpasswordcontroller);
                  }
                },
                child: Text('Edit'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
