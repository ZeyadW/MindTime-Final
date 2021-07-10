import 'dart:io';

//import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medico/widgets/Signup/docsignup.dart';
//import 'package:medico/widgets/Signup/signupform.dart';
//import 'package:path/path.dart' as path;

const pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
final validatePhone = RegExp(pattern);

/*
void _getFile() async {
  try {
    File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    print('file:' + file.path);
    _uploadfile(file);
  } catch (e) {
    print(e.message);
  }
}

class Doctorsignup extends StatefulWidget {
  //Doctorsignu({Key? key}) : super(key: key);

  @override
  _DoctorsignupState createState() => _DoctorsignupState();
}

class _DoctorsignupState extends State<Doctorsignup> {
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  File _imageFile;

  Future uploadImageToFirebase() async {
    String fileName = _imageFile.path;
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('drimages/');
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    taskSnapshot.ref.getDownloadURL().then(
          (value) => print("Done: $value"),
        );
  }

*/
class Doctorsignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* var row1 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(padding: EdgeInsets.only(top: 50.0)),
        Text(
          'Sign Up',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );*/
    var row2 = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Enter The new Doctor's details ",
          style: TextStyle(fontSize: 15, color: Colors.blue[900]),
        ),
      ],
    );

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor,
          title: Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 45.0),
            child: Text(
              'Add new Doctor',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )),
        ),
        body: Stack(
          children: [
            SafeArea(
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 16.0, right: 16.0, bottom: 32),
                  child: SingleChildScrollView(
                    /*child: Card(
                        elevation: 5,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),*/
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0),
                                topLeft: Radius.circular(30.0)),
                            color: Colors.white,
                          ),
                          height: MediaQuery.of(context).size.height * 0.78,
                          //  color: UIColors.bgColorScreen,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    FloatingActionButton(onPressed: () {
                                      //  _getFile();
                                    }),
                                    //  row1,
                                    row2,
                                    DocsignUpForm(),
                                    FlatButton(
                                        onPressed: () {}, child: Text('data')),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                ),
              ]),
            )
          ],
        ));
  }
}
