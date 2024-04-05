import 'dart:developer';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_appointment_app/models/doctor_model.dart';
import 'package:pet_appointment_app/models/medicine_model.dart';
import 'package:pet_appointment_app/utils/firebase_storage.dart';
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

// Update profile
  Future<String> updateProfile(
      {required DoctorModel doctorModel, Uint8List? image}) async {
    try {
      if (image != null) {
        String imageUrl = await StorageMethods()
            .uploadImageToStorage(image: image, uid: doctorModel.uid);
        DoctorModel doctor = DoctorModel(
            uid: doctorModel.uid,
            name: doctorModel.name,
            phoneNumber: doctorModel.phoneNumber,
            email: doctorModel.email,
            degree: doctorModel.degree,
            specialization: doctorModel.specialization,
            imageUrl: imageUrl);
        await _firebaseFirestore
            .collection("Doctors")
            .doc(doctorModel.uid)
            .update(doctor.toMap());
      } else {
        DoctorModel doctor = DoctorModel(
            uid: doctorModel.uid,
            name: doctorModel.name,
            phoneNumber: doctorModel.phoneNumber,
            email: doctorModel.email,
            degree: doctorModel.degree,
            specialization: doctorModel.specialization,
            imageUrl: doctorModel.imageUrl);
        await _firebaseFirestore
            .collection("Doctors")
            .doc(doctorModel.uid)
            .update(doctor.toMap());
      }

      return "Updated Successfully";
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
  Future<String> createMedicinePrescribtion(
      {required MedicineModel medicineModel}) async {
    try {
      String medicineId = uuid.v4();
      MedicineModel medicine = MedicineModel(
          medicineId: medicineId,
          petId: medicineModel.petId,
          ownerId: medicineModel.ownerId,
          prescribedMedication: medicineModel.prescribedMedication,
          administrationRoute: medicineModel.administrationRoute,
          dosage: medicineModel.dosage,
          dateAdministered: medicineModel.dateAdministered,
          diagnosisDetails: medicineModel.diagnosisDetails,
          vaccineName: medicineModel.vaccineName,
          nextDueDate: medicineModel.nextDueDate);
      await _firebaseFirestore
          .collection("Medicines")
          .doc(medicineId)
          .set(medicine.toMap());

      return "Medicine prescribition created";
    } on FirebaseException catch (error) {
      return error.toString();
    }
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
