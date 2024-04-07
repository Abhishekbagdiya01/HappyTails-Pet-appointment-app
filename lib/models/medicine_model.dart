import 'package:cloud_firestore/cloud_firestore.dart';

class MedicineModel {
  String medicineId;
  String ownerId;
  String petId;
  String diagnosisDetails;
  String prescribedMedication;
  String dosage;
  String vaccineName;
  String administrationRoute;
  String dateAdministered;
  String nextDueDate;

  MedicineModel({
    required this.medicineId,
    required this.ownerId,
    required this.petId,
    required this.diagnosisDetails,
    required this.prescribedMedication,
    required this.dosage,
    required this.vaccineName,
    required this.administrationRoute,
    required this.dateAdministered,
    required this.nextDueDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'medicineId': medicineId,
      'ownerId': ownerId,
      'petId': petId,
      'diagnosisDetails': diagnosisDetails,
      'prescribedMedication': prescribedMedication,
      'dosage': dosage,
      'vaccineName': vaccineName,
      'administrationRoute': administrationRoute,
      'dateAdministered': dateAdministered,
      'nextDueDate': nextDueDate
    };
  }

  factory MedicineModel.fromSnap(DocumentSnapshot documentSnapshot) {
    final snap = documentSnapshot.data() as Map<String, dynamic>;
    return MedicineModel(
        medicineId: snap['medicineId'],
        ownerId: snap['ownerId'],
        petId: snap['petId'],
        diagnosisDetails: snap['diagnosisDetails'],
        prescribedMedication: snap['prescribedMedication'],
        dosage: snap['dosage'],
        vaccineName: snap['vaccineName'],
        administrationRoute: snap['administrationRoute'],
        dateAdministered: snap['dateAdministered'],
        nextDueDate: snap['nextDueDate']);
  }
}
