import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medico/widgets/admin/editdr.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:medico/models/users.dart';
import 'package:medico/pages/EditProfile.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class EditdrForm extends StatefulWidget {
  @override
  EditdrFormState createState() {
    return EditdrFormState();
  }
}

//DocumentSnapshot variable;

class EditdrFormState extends State<EditdrForm> {
  String doctoremail;
  var name;
  var loc;
  var email;
  var desc;
  var pass;

  var username;
  var _passwordVisible;
  FocusNode myFocusNode;

  void getdoctoremail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    doctoremail = prefs.getString('doctoremail');
    print("in get doctor email function" + doctoremail);
    name = prefs.getString('doctorname');
    loc = prefs.getString('doctorloc');
    desc = prefs.getString('doctordesc');
    pass = prefs.getString('doctorpass');
    print(name + "  " + loc + "  " + desc + "  " + pass);
  }

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
    //getdoctoremail();
    //getdetails();
    myFocusNode = FocusNode();
  }

  Future<bool> EditProfile(namecontroller, locationcontoller,
      descriptioncontroller, passwordcontroller, newpasswordcontroller) async {
    Widget okButtonwrong = FlatButton(
      child: Text(
        "Ok",
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context)
            .push(new MaterialPageRoute(builder: (context) => Editdr()));
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

   
    getdoctoremail();
    print("description:"+desc);
    print("location:"+loc);
    print("password:"+pass);
    print("desc contoller =S" + descriptioncontroller.text);
    if (descriptioncontroller.text == "") {
      print(descriptioncontroller.text);
      descriptioncontroller.text = desc;
      print(" decription" + desc);
      print("id fexc is null" + descriptioncontroller.text);
    }
    if (locationcontoller.text == "") {
      locationcontoller.text = loc;
    }
    if (namecontroller.text == "") {
      namecontroller.text = name;
    }
    if (pass == passwordcontroller.text) {
      if (newpasswordcontroller.text == "") {
        print("new    passs");
        print(newpasswordcontroller.text);
        newpasswordcontroller.text = passwordcontroller.text;
      }
      try {
        await FirebaseFirestore.instance
            .collection("Therapists")
            .doc(doctoremail)
            .update({
          'location': locationcontoller.text,
          'description': descriptioncontroller.text,
          'password': newpasswordcontroller.text,
          'name': namecontroller.text,
        });
        // prefs.setString('username', namecontroller.text);

        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Profile updated successfully"),
              actions: [okButton],
            );
          },
        );
      } on FirebaseException catch (e) {
        print("ffffffffffffff");
        print(e);
      } catch (e) {
        print("eeeeeeeeeee" + e);
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
    final namecontroller = TextEditingController();
    final locationcontoller = TextEditingController();
    final descriptioncontroller = TextEditingController();
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
              // initialValue: name,
              controller: namecontroller,
              autofocus: true,
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.perm_identity),
                  labelText: 'Enter therapist name',
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
              /* validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },*/
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
              // initialValue: variable.get("location"),
              controller: locationcontoller,
              autofocus: true,
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.perm_identity),
                  labelText: 'new location',
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
              /*validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                //return null;
              },*/
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
              // initialValue: variable.get("description"),
              controller: descriptioncontroller,
              autofocus: true,
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.perm_identity),
                  labelText: 'Description',
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
                      // Update the state i.e. toogle the state of passwordVisible variable
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
              /* validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },*/
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
              controller: newpasswordcontroller,
              obscureText: !_passwordVisible,
              style: TextStyle(color: Colors.blue),
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
              /*  validator: (value) {
                if (!value.contains(validCharactersPassword)) {
                  return 'Please enter the correct format';
                }
                return null;
              },*/
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
                  //getdoctordetails();
                  if (_formKey.currentState.validate()) {
                    EditProfile(
                        namecontroller,
                        locationcontoller,
                        descriptioncontroller,
                        passwordcontroller,
                        newpasswordcontroller);
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
