import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_appointment_app/models/doctor_model.dart';

class DoctorAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String> signUpDoctor({required DoctorModel doctorModel}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: doctorModel.email!, password: doctorModel.password!);

      DoctorModel newUser = DoctorModel(
          uid: _auth.currentUser!.uid,
          name: doctorModel.name,
          email: doctorModel.email,
          phoneNumber: doctorModel.email,
          degree: doctorModel.degree,
          accountType: "Doctor",
          specialization: doctorModel.specialization);
      await _firebaseFirestore
          .collection("Doctors")
          .doc(_auth.currentUser!.uid)
          .set(newUser.toMap());
      return "Successfully Signed in";
    } on FirebaseAuthException catch (error) {
      return error.message.toString();
    }
  }

  Future<String> loginDoctor(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Successfully login";
    } on FirebaseAuthException catch (error) {
      return error.message.toString();
    }
  }
}
