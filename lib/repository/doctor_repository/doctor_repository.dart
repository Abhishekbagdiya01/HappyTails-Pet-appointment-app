import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_appointment_app/models/doctor_model.dart';
import 'package:pet_appointment_app/models/medicine_model.dart';
import 'package:uuid/uuid.dart';

class DoctorRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final uuid = Uuid();
// Get doctor by id
  Future<DoctorModel> getDoctorById({required String uid}) async {
    try {
      final user =
          await _firebaseFirestore.collection("Doctors").doc(uid).get();
      return DoctorModel.fromSnap(user);
    } on FirebaseException catch (error) {
      throw error.message ?? "An unexpected error occurred";
    }
  }

  // List of All Doctors
  Future<List<DoctorModel>> getAllDoctors() async {
    try {
      QuerySnapshot doctorCollection =
          await _firebaseFirestore.collection("Doctors").get();
      List<DoctorModel> listOfDoctors = [];
      doctorCollection.docs.forEach(
        (docs) {
          listOfDoctors.add(DoctorModel.fromSnap(docs));
        },
      );

      log("legnth : ${listOfDoctors.length} ");

      return listOfDoctors;
    } on FirebaseException catch (error) {
      throw error.message ?? "An unexpected error occurred";
    }
  }

/*          MEDICINE                               */
  //create medicine
  createMedicinePrescribtion(MedicineModel medicineModel) async {
    String medicineId = uuid.v4();
    MedicineModel medicine = MedicineModel(
        medicineId: medicineId,
        petId: medicineModel.petId,
        medicineName: medicineModel.medicineName,
        dosage: medicineModel.dosage,
        duration: medicineModel.duration,
        instructions: medicineModel.instructions);
    _firebaseFirestore
        .collection("Medicines")
        .doc(medicineId)
        .set(medicine.toMap());
  }

  // Get medicine report by petId
  Future<MedicineModel> getMedicineReportByPetId(String petId) async {
    QuerySnapshot querySnapshot = await _firebaseFirestore
        .collection("Medicines")
        .where("petId", isEqualTo: petId)
        .get();
    final medicineReport = querySnapshot.docs.first;

    return MedicineModel.fromSnap(medicineReport);
  }
}
