import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:medico/models/users.dart';

DateTime now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);

class Doctor {
  String name;
  String password;
  String date;
  String email;
  String location;
  String description;

  Doctor(
      {this.name,
      this.password,
      this.date,
      this.email,
      this.location,
      this.description});

  String getname() {
    return name;
  }

  Future<String> getEmail() {
    return Future.value(email);
  }

  Future<Doctor> adddoctor(
      email, password, description, date, location, name) async {
    /*  final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('email', email);
*/
    await FirebaseFirestore.instance.collection("Therapists").doc(email).set({
      'name': name,
      'email': email,
      'password': password,
      'birthdate': date,
      'location': location,
      'description': description,
    });

    //setData take a map as input

    Doctor dr = new Doctor(
        name: name,
        password: password,
        description: description,
        date: date,
        email: email,
        location: location);
    //myusers.add(u);*/
    return dr;
  }
}

class Doctors extends Doctor {
  var users = [];
  var appointments;
  var name;
  var location;
  var date;
  var description;
  var email;
  var password;

  DocumentReference reference;

  Doctors({
    this.users,
    this.appointments,
  });
  Future<Doctor> adddoctor(
      email, password, description, date, location, name) async {
    /*  final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('email', email);
*/
    await FirebaseFirestore.instance.collection("Therapists").doc(email).set({
      'name': name,
      'email': email,
      'password': password,
      'birthdate': date,
      'location': location,
      'description': description,
    });

    //setData take a map as input

    Doctor dr = new Doctor(
        name: name,
        password: password,
        description: description,
        date: date,
        email: email,
        location: location);
    //myusers.add(u);*/
    return dr;
  }

  Doctors.fromMap(Map<String, dynamic> map, {this.reference})
      : // assert(map['appointments'] != null),
        //assert(map['user'] != null),
        //assert(map['imagepath'] != null),
        assert(map['name'] != null),
        assert(map['email'] != null),
        assert(map['location'] != null),
        assert(map['description'] != null),
        name = map['name'],
        email = map['email'],
        location = map['location'],
        description = map['description'];
  Doctors.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<:$appointments";
}
