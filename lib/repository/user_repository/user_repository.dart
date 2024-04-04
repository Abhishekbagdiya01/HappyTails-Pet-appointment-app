import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_appointment_app/models/meet_up_model.dart';
import 'package:pet_appointment_app/models/user_model.dart';
import 'package:uuid/uuid.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final uuid = Uuid();
// Get user by ID
  Future<UserModel> getUserById({required String uid}) async {
    try {
      final user = await _firebaseFirestore.collection("Users").doc(uid).get();
      return UserModel.fromSnap(user);
    } on FirebaseException catch (error) {
      throw error.message ?? "An unexpected error occurred";
    }
  }

//MEET-UPS
//create meet-ups
  Future<String> createMeetUps({required MeetUpsModel meetUpsModel}) async {
    try {
      String uid = _auth.currentUser!.uid;
      MeetUpsModel meetUp = MeetUpsModel(
          uid: uid,
          title: meetUpsModel.title,
          details: meetUpsModel.details,
          dateTime: meetUpsModel.dateTime,
          location: meetUpsModel.location,
          participients: meetUpsModel.participients);
      await _firebaseFirestore
          .collection("Meetups")
          .doc(uid)
          .set(meetUp.toMap());
      return "Meet-up created";
    } on FirebaseException catch (error) {
      return "Error : ${error.message}";
    }
  }

  // Delete Meetups
  Future<String> deleteMeetUps({required String uid}) async {
    try {
      String uid = _auth.currentUser!.uid;

      await _firebaseFirestore.collection("Meetups").doc(uid).delete();

      return "Meet-up deleted";
    } on FirebaseException catch (error) {
      return "Error : ${error.message}";
    }
  }

//fetch all meetups
  Future<List<MeetUpsModel>> getAllMeetUps() async {
    try {
      final meetUpsCollection =
          await _firebaseFirestore.collection("Meetups").get();

      List<MeetUpsModel> listOfMeetups = [];
      meetUpsCollection
        ..docs.forEach((doc) {
          listOfMeetups.add(MeetUpsModel.fromSnap(doc));
        });

      log("legnth : ${listOfMeetups.length} ");
      return listOfMeetups;
    } on FirebaseException catch (error) {
      throw error.message ?? "An unexpected error occurred";
    }
  }
}
