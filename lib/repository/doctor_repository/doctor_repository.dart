import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_appointment_app/models/doctor_model.dart';

class DoctorRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

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
      final doctorCollection =
          await _firebaseFirestore.collection("Doctors").get();
      List<DoctorModel> listOfDoctors = doctorCollection.docs
          .map((docs) => docs.data())
          .toList() as List<DoctorModel>;

      log("legnth : ${listOfDoctors.length} ");

      return listOfDoctors;
    } on FirebaseException catch (error) {
      throw error.message ?? "An unexpected error occurred";
    }
  }
}
