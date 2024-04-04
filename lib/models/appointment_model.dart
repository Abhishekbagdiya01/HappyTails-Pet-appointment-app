import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModel {
  String appointmentId;
  String petId;
  String userId;
  String doctorId;
  String petName;
  String date;
  String time;
  String brandOfFood;
  String typeOfTreats;
  String amountOfFeeding;
  String diseases;
  String? status;
  AppointmentModel(
      {required this.appointmentId,
      required this.petId,
      required this.userId,
      required this.doctorId,
      required this.petName,
      required this.date,
      required this.time,
      required this.brandOfFood,
      required this.typeOfTreats,
      required this.amountOfFeeding,
      required this.diseases,
      this.status});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appointmentId': appointmentId,
      'petId': petId,
      'userId': userId,
      'doctorId': doctorId,
      'date': date,
      'time': time,
      'brandOfFood': brandOfFood,
      'typeOfTreats': typeOfTreats,
      'amountOfFeeding': amountOfFeeding,
      'diseases': diseases,
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
        petName: snapShot['petName'],
        date: snapShot['date'],
        time: snapShot['time'],
        brandOfFood: snapShot['brandOfFood'],
        typeOfTreats: snapShot['typeOfTreats'],
        amountOfFeeding: snapShot['amountOfFeeding'],
        diseases: snapShot['diseases'],
        status: snapShot['status']);
  }
}
