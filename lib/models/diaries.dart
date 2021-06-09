import 'package:cloud_firestore/cloud_firestore.dart';

DateTime now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);

class Diary {
  var text;
  var title;
  var diaryid;
  var timestamp;

  Diary({
    this.text,
    this.title,
    this.diaryid,
    this.timestamp,
  });
}

class Diaries {
  var text;
  var title;
  var diaryid;
  var timestamp;
  DocumentReference reference;
  //List<Diary> ds = [];
  Diaries({
    this.text,
    this.title,
    this.diaryid,
    this.timestamp,
    this.reference,
  });

  Diaries.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['text'] != null),
        assert(map['title'] != null),
        assert(map['timestamp'] != null),
        text = map['text'],
        title = map['title'],
        diaryid = map['diaryid'],
        timestamp = map['timestamp'];
  Diaries.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<$text:$title:$diaryid>";
}
