import 'package:cloud_firestore/cloud_firestore.dart';

class MeetUpsModel {
  String uid;
  String title;
  String details;
  String dateTime;
  List participients;
  MeetUpsModel({
    required this.uid,
    required this.title,
    required this.details,
    required this.dateTime,
    required this.participients,
  });
  factory MeetUpsModel.fromSnap(DocumentSnapshot documentSnapshot) {
    final snapShot = documentSnapshot.data() as Map<String, dynamic>;
    return MeetUpsModel(
        uid: snapShot["uid"],
        title: snapShot["title"],
        details: snapShot["details"],
        dateTime: snapShot["dateTime"],
        participients: snapShot["participients"]);
  }
  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "title": title,
      "details": details,
      "dateTime": dateTime,
      "participients": participients
    };
  }
}
