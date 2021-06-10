import 'package:flutter/material.dart';
import 'package:medico/models/appointments.dart' as model;
import 'package:medico/models/user.dart';
//import 'package:medico/pages/AORAppointment.dart';
import 'package:medico/widgets/Journal/editjournal.dart';
import 'package:medico/config/app_config.dart' as config;

class ViewpatientsWidget extends StatefulWidget {
  final model.Appointment appointment;
  final date;
  const ViewpatientsWidget({Key key, this.appointment, this.date})
      : super(key: key);

  @override
  _ViewpatientsWidgetState createState() => _ViewpatientsWidgetState();
}

class _ViewpatientsWidgetState extends State<ViewpatientsWidget> {
  User currentUser = new User.init().getCurrentUser();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          onTap: () {
           /* Navigator.push(context,
                new MaterialPageRoute(builder: (context) => AORAppointment()));*/
          },
          title: Container(
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                gradient: new LinearGradient(
                    colors: [
                      config.Colors().mainDarkColor(1),
                      Colors.blue[200],
                      config.Colors().mainDarkColor(1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.centerRight,
                    tileMode: TileMode.clamp)),
            child: Card(
              //color: Colors.transparent,
              elevation: 0.2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Container(
                /* decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        offset: Offset(0, 4),
                        blurRadius: 10)
                  ],
                ),*/
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 20.0, left: 0.0, right: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 25.0),
                          child: ball(this.widget.appointment.doctor.avatar),
                        ),
                        Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${widget.appointment.doctor.name}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              '${date}',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Poppins',
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                    Container(
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          //Navigator.of(context).pushNamed('/chat');
                        },
                        icon: Icon(Icons.calendar_today),
                        iconSize: 20,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        //SizedBox(height: 20.0,child: Center(child: Container(height: 2.0,color: Colors.grey.withOpacity(0.1),),),),
      ],
    ));
  }

  Widget ball(String image) {
    return Container(
      height: 60,
      width: 60.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          )),
    );
  }
}
