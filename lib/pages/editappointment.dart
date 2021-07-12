import 'package:date_field/date_field.dart';
//import 'package:day_picker/day_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medico/pages/viewappointmentsdoctor.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'viewappointmentsdoctor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medico/models/appointments.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medico/config/app_config.dart' as config;

class ViewAppointment extends StatefulWidget {
  appointment appoint = new appointment();
  ViewAppointment(appoint) {
    this.appoint = appoint;
  }
  @override
  _ViewAppointmentState createState() => _ViewAppointmentState(this.appoint);
}

class _ViewAppointmentState extends State<ViewAppointment> {
  appointment appoint = new appointment(); //= d.Diaries();
  TextEditingController _remindersTxtController;

  TextEditingController hrController;
  _ViewAppointmentState(this.appoint) {}
  @override
  void initState() {
    super.initState();
    setEmail(); // calls getconnect method to check which type if connection it
  }

  var email;
  Future<bool> setEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    setState(() {
      email = prefs.getString('email');
    });
    return true;
  }

  List hrstable;

  DateTime v;

  final calendarcont = DateRangePickerController();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  dynamic daysarray;
  DateTime cStrt;

  var tn;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit appointment'),
        backgroundColor: config.Colors().mainColor(1),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: new SingleChildScrollView(
              child: Column(children: [
            Container(
              margin:
                  new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                color: config.Colors().mainColor(1),
              ),
            ),
            Container(
                margin:
                    new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21.0),
                  color: config.Colors().mainColor(1),
                ),
                child: SfDateRangePicker(
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs args) {
                    if (args.value is PickerDateRange) {
                      final DateTime rangeStartDate = args.value.startDate;
                      final DateTime rangeEndDate = args.value.endDate;

                      cStrt = rangeEndDate;
                    }
                  },
                  controller: calendarcont,
                  selectionMode: DateRangePickerSelectionMode.single,
                  initialSelectedRange: PickerDateRange(
                      appoint.sessionDate.toDate(),
                      appoint.sessionDate.toDate()),
                )),
            Container(
              margin: new EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                color: const Color(0xffffffff),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        controller: hrController,
                        keyboardType: TextInputType.number,
                        autofocus: true,
                        style: TextStyle(color: const Color(0xff205072)),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.tab_outlined),
                            labelText: 'Sessions per day',
                            labelStyle:
                                TextStyle(color: const Color(0xff205072)),
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: const Color(0xff205072)),
                              borderRadius: BorderRadius.circular(21.0),
                            )),
                        validator: (value) {
                          if (value.isEmpty || value == 0) {
                            return 'Please enter a number';
                          }
                          return null;
                        },
                      ),
                    ),
                    FlatButton(
                      child: Text('Select Sessions Times'),
                      onPressed: () async {
                        int mc = int.parse(hrController.text);
                        hrstable = new List(mc);

                        for (var i = mc; i > 0; i--) {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return SimpleDialog(
                                  title: Text("Set Session $i Time"),
                                  children: <Widget>[
                                    Container(
                                      child: DateTimeFormField(
                                        initialValue:
                                            appoint.sessionDate[i - 1].toDate(),
                                        decoration: const InputDecoration(
                                          hintStyle:
                                              TextStyle(color: Colors.black45),
                                          errorStyle: TextStyle(
                                              color: Colors.redAccent),
                                          border: OutlineInputBorder(),
                                          suffixIcon: Icon(Icons.event_note),
                                          labelText: 'Session Duration',
                                        ),
                                        mode: DateTimeFieldPickerMode.time,
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        validator: (e) => (e?.day ?? 0) == null
                                            ? 'choose an aproprite date.'
                                            : null,
                                        onDateSelected: (DateTime value) {
                                          v = value;
                                          print(i - 1); //1,2

                                          print("zeyad $v");
                                          appoint.sessionDate[i - 1] = v;
                                          print(hrstable);
                                        },
                                      ),
                                    ),
                                    FlatButton(
                                      child: Text('next'),
                                      onPressed: () async {
                                        Navigator.of(ctx).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin:
                  new EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                gradient: RadialGradient(
                  center: Alignment(-0.88, -1.0),
                  radius: 1.35,
                  colors: [
                    config.Colors().mainColor(1),
                    config.Colors().mainDarkColor(1)
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
              child: FlatButton(
                child: Text('Save'),
                onPressed: () async {
                  if (cStrt == null) {
                    //grab bara el for loop el zar2a
                    cStrt = appoint.sessionDate.toDate();
                  }
                  print(hrstable);
                  print(int.parse(hrController.text));
                  appoint.updateAppointment(hrstable, cStrt, hrController.text);
                  // if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  // }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewAppointmentsDoctor()),
                  );
                },
              ),
            )
          ])),
        ),
      ),
    );
  }
}
