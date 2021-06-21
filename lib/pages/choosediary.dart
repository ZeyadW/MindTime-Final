import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medico/pages/AddVideo.dart';
//import 'package:medico/pages/journal.dart';

class ChooseDiary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var row1 = Container(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: SizedBox.fromSize(
        size: Size(80, 80), // button width and height
        child: ClipOval(
          child: Material(
            color: Theme.of(context).accentColor, // button color
            child: InkWell(
              splashColor: Theme.of(context).accentColor, // splash color
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoUpload(
                            title: 'Upload Video Diary',
                          )),
                );
              }, // button pressed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.video_library_rounded,
                    color: Colors.white,
                    size: 48,
                  ),
                  // icon
                  Text("Video", style: TextStyle(color: Colors.white)), // text
                ],
              ),
            ),
          ),
        ),
      ),
    ));

    var row2 = Container(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: SizedBox.fromSize(
              size: Size(80, 80), // button width and height
              child: ClipOval(
                child: Material(
                  color: Theme.of(context).accentColor, // button color
                  child: InkWell(
                    splashColor: Colors.blue, // splash color
                    onTap: () {
                      Navigator.of(context).pushNamed('/viewjournalstext');

                      /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Journal()),
                      );*/
                    }, // button pressed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.menu_book_outlined,
                          color: Colors.white,
                          size: 48,
                        ),
                        // icon
                        Text("Text",
                            style: TextStyle(color: Colors.white)), // text
                      ],
                    ),
                  ),
                ),
              ),
            )));

    var row3 = Container(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: SizedBox.fromSize(
              size: Size(80, 80), // button width and height
              child: ClipOval(
                child: Material(
                  color: Theme.of(context).accentColor, // button color
                  child: InkWell(
                    splashColor: Colors.blue, // splash color
                    onTap: () {}, // button pressed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.audiotrack,
                          color: Colors.white,
                          size: 48,
                        ),
                        // icon
                        Text("Audio",
                            style: TextStyle(color: Colors.white)), // text
                      ],
                    ),
                  ),
                ),
              ),
            )));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          'Choose Journal Type',
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(70, 230, 0, 0),
          child: Row(
            children: [row1, row2, row3],
          ),
        ),
      ),
    );
  }
}
