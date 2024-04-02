import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModel {
  String appointmentId;
  String petId;
  String userId;
  String doctorId;
  String dateTime;
  String status;
  AppointmentModel(
      {required this.appointmentId,
      required this.petId,
      required this.userId,
      required this.doctorId,
      required this.dateTime,
      required this.status});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appointmentId': appointmentId,
      'petId': petId,
      'userId': userId,
      'doctorId': doctorId,
      'dateTime': dateTime,
      'status': status
    };
  }

  factory AppointmentModel.fromSnap(DocumentSnapshot documentSnapshot) {
    final snapShot = documentSnapshot.data() as Map<String, dynamic>;
    return AppointmentModel(
        appointmentId: snapShot['appointmentId'],
        petId: snapShot['petId'],
        userId: snapShot['userId'],
        doctorId: snapShot['doctorId'],
        dateTime: snapShot['dateTime'],
        status: snapShot['status']);
  }
}
