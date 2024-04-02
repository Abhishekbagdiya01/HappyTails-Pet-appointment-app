import 'package:cloud_firestore/cloud_firestore.dart';

class PetModel {
  String petId;
  String petName;
  String ownerId;
  String doctorId;
  String gender;
  String category;
  String breed;
  String age;
  PetModel({
    required this.petId,
    required this.petName,
    required this.ownerId,
    required this.doctorId,
    required this.gender,
    required this.category,
    required this.breed,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'petId': petId,
      'petName': petName,
      'ownerId': ownerId,
      'doctorId': doctorId,
      'gender': gender,
      'category': category,
      'breed': breed,
      'age': age
    };
  }

  factory PetModel.fromSnap(DocumentSnapshot documentSnapshot) {
    final snap = documentSnapshot.data() as Map<String, dynamic>;
    return PetModel(
        petId: snap['petId'],
        petName: snap['petName'],
        ownerId: snap['ownerId'],
        doctorId: snap['doctorId'],
        gender: snap['gender'],
        category: snap['category'],
        breed: snap['breed'],
        age: snap['age']);
  }
}
