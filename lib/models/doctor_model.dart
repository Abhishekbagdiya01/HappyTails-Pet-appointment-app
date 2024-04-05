import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel {
  String uid;
  String name;
  String email;
  String phoneNumber;
  String degree;
  String specialization;
  String? accountType;
  String? password;
  String imageUrl;

  DoctorModel(
      {required this.uid,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.degree,
      required this.specialization,
      this.accountType,
      this.password,
      required this.imageUrl});

  static fromSnap(DocumentSnapshot documentSnapshot) {
    final snapShot = documentSnapshot.data() as Map<String, dynamic>;
    return DoctorModel(
        uid: snapShot["uid"],
        name: snapShot["name"],
        email: snapShot['uid'],
        phoneNumber: snapShot['phoneNumber'],
        degree: snapShot['degree'],
        specialization: snapShot['specialization'],
        accountType: snapShot['accountType'],
        imageUrl: snapShot["imageUrl"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "degree": degree,
      "specialization": specialization,
      "accountType": accountType,
      "imageUrl": imageUrl
    };
  }
}
