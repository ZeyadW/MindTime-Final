import 'package:flutter/material.dart';
import 'package:medico/models/doctoss.dart';
import 'package:medico/models/users.dart';

//import 'package:medico/Service/FlutterFireauth.dart';
//import 'package:project_mobile/models/users.dart';

//import 'package:medico/Pages/home.dart';
import 'package:date_field/date_field.dart';
import 'package:medico/pages/admin/admin.dart';

const pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
final validatePhone = RegExp(pattern);

class DocsignUpForm extends StatefulWidget {
  @override
  DocsignUpFormState createState() {
    return DocsignUpFormState();
  }
}

class DocsignUpFormState extends State<DocsignUpForm> {
  var _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  static final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');

  static final validCharactersPassword = RegExp(r'^[a-zA-Z0-9_\-=@\.;{6,}+$]');
  static final validateDate = RegExp("[0-9/]");
  Users u = new Users();
  final locationcontroller = TextEditingController();
  final desccontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  final emergencycontactcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  DateTime selectedDate;
  @override
  Widget build(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text(
        "Ok",
      ),
      onPressed: () async {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TabBarDemo()
                /*.ut(
                      u: u.signup(
                          usernamecontroller.text,
                          passwordcontroller.text,
                          emergencycontactnamecontroller.text,
                          // datecontroller.text,
                          selectedDate.toString(),
                          emailcontroller.text,
                          emergencycontactcontroller.text))
                          */
                ));
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
              controller: namecontroller,
              style: TextStyle(color: Colors.blue[900]),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.perm_identity),
                  labelText: "Enter Doctor's Name",
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
                if (!value.contains(validCharacters)) {
                  return 'Please enter the correct format';
                }
                return null;
              },
            ),
          ),
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
              controller: locationcontroller,
              style: TextStyle(color: Colors.blue[900]),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_history),
                  labelText: "Enter Doctor's Location",
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
                if (!value.contains(validCharacters)) {
                  return 'Please enter the correct format';
                }
                return null;
              },
            ),
          ),
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
              controller: desccontroller,
              style: TextStyle(color: Colors.blue[900]),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.notes),
                  labelText: "Enter Doctor's Description",
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
                /* if (!value.contains(validCharacters)) {
                  return 'Please enter the correct format';
                }*/
                return null;
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
            child: TextFormField(
              controller: emailcontroller,
              style: TextStyle(color: Colors.blue[900]),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email  "@mindtime.com"',
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
                if (!value.contains('.')) {
                  return 'Please enter the correct email format';
                }
                return value.contains('@mindtime.com')
                    ? null
                    : 'Please enter the correct email format';
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
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
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

                return null;
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
                    color: const Color(0xff000000),
                    offset: Offset(0, 13),
                    blurRadius: 15,
                    spreadRadius: -15.0),
              ],
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: FlatButton(
                onPressed: () {
                  Doctor dr = new Doctor();
                  dr.adddoctor(
                      emailcontroller.text,
                      passwordcontroller.text,
                      desccontroller.text,
                      selectedDate,
                      locationcontroller.text,
                      namecontroller.text);
                  // Validate returns true if the form is valid, or false
                  // otherwise.

                  if (_formKey.currentState.validate()) {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text("Account created successfully"),
                          actions: [okButton],
                        );
                      },
                    );
                  }
                },
                child: Text('Sign Up'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
