import 'package:date_field/date_field.dart';
import 'package:day_picker/day_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../models/appointments.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medico/config/app_config.dart' as config;

import 'viewappointments.dart';

class AddAppointment extends StatefulWidget {
  @override
  _AddAppointmentState createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  appointment r = new appointment();
  final myController = TextEditingController();
  List hrstable;
  DateTime v;
  final hrController = TextEditingController();
  final calendarcont = DateRangePickerController();
  dynamic daysarray;
  DateTime cStrt;
  DateTime cEnd;
  var tn;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Appointments'),
        backgroundColor: config.Colors().mainColor(1),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: new SingleChildScrollView(
              child: Column(children: [
            Center(
              child: Text(
                'Enter your appointment details',
                style: TextStyle(
                  fontFamily: 'Montserrat-Medium',
                  fontSize: 15,
                  color: const Color(0xff205072),
                  height: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                color: const Color(0xffffffff),
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
                      final DateTime SessionDate = args.value.startDate;
                      final DateTime rangeEndDate = args.value.endDate;
                      cStrt = SessionDate;
                      cEnd = rangeEndDate;
                    }
                  },
                  controller: calendarcont,
                  selectionMode: DateRangePickerSelectionMode.single,
                  initialSelectedRange: PickerDateRange(
                      DateTime.now().subtract(const Duration(days: 4)),
                      DateTime.now().add(const Duration(days: 3))),
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
                padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        controller: myController,
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
                      child: Text('Set Time'),
                      onPressed: () async {
                        int mc = int.parse(myController.text);
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
                                        decoration: const InputDecoration(
                                          hintStyle:
                                              TextStyle(color: Colors.black45),
                                          errorStyle: TextStyle(
                                              color: Colors.redAccent),
                                          border: OutlineInputBorder(),
                                          suffixIcon: Icon(Icons.event_note),
                                          labelText: 'Course Duration',
                                        ),
                                        mode: DateTimeFieldPickerMode.time,
                                        autovalidateMode:
                                            AutovalidateMode.always,
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select a duration';
                                          }
                                          return null;
                                        },
                                        onDateSelected: (DateTime value) {
                                          v = value;
                                          print(i - 1); //1,2

                                          print(v);
                                          hrstable[i - 1] = v;
                                          print(hrstable);
                                        },
                                      ),
                                    ),
                                    FlatButton(
                                      child: Text('next'),
                                      onPressed: () async {
                                        if (hrstable.isNotEmpty)
                                          Navigator.of(ctx).pop();
                                        return 'Please select a duration';
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
                  if (cStrt == null && cEnd == null) {
                    //grab bara el for loop el zar2a
                    cStrt = DateTime.now();
                    cEnd = DateTime.now().add(Duration(days: 2));
                  }

                  if (cStrt != null && cEnd == null) {
                    //grab bara el for loop el zar2a
                    cStrt = cStrt;
                    cEnd = cStrt.add(Duration(days: 3));
                  }
                  r.createAppointment(hrstable, cEnd, myController.text);
                  // if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.

                  // }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewAppointments()),
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
