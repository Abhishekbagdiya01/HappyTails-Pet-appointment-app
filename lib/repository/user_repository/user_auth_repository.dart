import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_appointment_app/models/user_model.dart';

class UserAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String> signUpUser({required UserModel userModel}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!);

      UserModel newUser = UserModel(
          uid: _auth.currentUser!.uid,
          name: userModel.name,
          email: userModel.email,
          appointments: [],
          doctors: [],
          pets: [],
          phoneNumber: userModel.email);
      await _firebaseFirestore
          .collection("Users")
          .doc(_auth.currentUser!.uid)
          .set(newUser.toMap());
      return "Successfully Signed Up";
    } on FirebaseAuthException catch (error) {
      return error.message.toString();
    }
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Successfully login";
    } on FirebaseAuthException catch (error) {
      return error.message.toString();
    }
  }

  Future<String> logoutUser() async {
    await _auth.signOut();
    return "logout successful";
  }
}
