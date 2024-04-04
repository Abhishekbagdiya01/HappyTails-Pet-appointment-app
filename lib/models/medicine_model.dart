import 'package:cloud_firestore/cloud_firestore.dart';

class MedicineModel {
  String medicineId;
  String petId;
  String medicineName;
  String dosage;
  String duration;
  String instructions;
  MedicineModel({
    required this.medicineId,
    required this.medicineName,
    required this.petId,
    required this.dosage,
    required this.duration,
    required this.instructions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'medicineId': medicineId,
      'medicineName': medicineName,
      'petId': petId,
      'dosage': dosage,
      'duration': duration,
      'instructions': instructions,
    };
  }

  factory MedicineModel.fromSnap(DocumentSnapshot documentSnapshot) {
    final snap = documentSnapshot.data() as Map<String, dynamic>;
    return MedicineModel(
      medicineId: snap['medicineId'],
      medicineName: snap['medicineName'],
      petId: snap['petId'],
      dosage: snap['dosage'],
      duration: snap['duration'],
      instructions: snap['instructions'],
    );
  }
}
