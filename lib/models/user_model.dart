import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  List? pets;
  List? doctors;
  List? appointments;
  String? profileUrl;

  UserModel(
      {required this.uid,
      this.name,
      this.phoneNumber,
      this.email,
      this.appointments,
      this.pets,
      this.doctors,
      this.profileUrl,
      this.password});

  static fromSnap(DocumentSnapshot documentSnapshot) {
    final snapShot = documentSnapshot.data() as Map<String, dynamic>;
    return UserModel(
        uid: snapShot["uid"],
        name: snapShot["name"],
        email: snapShot['email'],
        phoneNumber: snapShot['phoneNumber'],
        profileUrl: snapShot["profileUrl"],
        appointments: snapShot["appointments"],
        doctors: snapShot["doctors"],
        pets: snapShot["pets"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "profileUrl": profileUrl,
      "appointments": appointments,
      "doctors": doctors,
      "pets": pets,
    };
  }
}
