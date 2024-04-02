import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_appointment_app/models/appointment_model.dart';
import 'package:pet_appointment_app/models/meet_up_model.dart';
import 'package:pet_appointment_app/models/pet_model.dart';
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

/*PETS*/
//create pet profie
  Future addPet({required PetModel petModel}) async {
    try {
      String petId = uuid.v4();
      PetModel pet = PetModel(
          petId: petId,
          petName: petModel.petName,
          ownerId: petModel.ownerId,
          doctorId: petModel.doctorId,
          gender: petModel.gender,
          category: petModel.category,
          breed: petModel.breed,
          age: petModel.age);
      await _firebaseFirestore
          .collection("Pets")
          .doc(petId)
          .set(pet.toMap())
          .then((value) {
        _firebaseFirestore.collection("Users").doc(pet.ownerId).update({
          "pets": FieldValue.arrayUnion([petId])
        });
      });
      return "Pet added";
    } on FirebaseException catch (error) {
      return "${error.message}";
    }
  }

//Get pet by Id
  Future<PetModel> getPetByID({required String petId}) async {
    final pet = await _firebaseFirestore.collection("pets").doc(petId).get();
    return PetModel.fromSnap(pet);
  }

  //remove pet profie

  Future removePet({required String petId}) async {
    try {
      await _firebaseFirestore.collection("Pets").doc(petId).delete();
      return "Pet removed";
    } on FirebaseException catch (error) {
      return "${error.message}";
    }
  }

//Get all pets by uid
  Future<List<PetModel>> getAllPetFromByUid(
      String uid, AppointmentModel appointmentModel) async {
    QuerySnapshot querySnapshot = await _firebaseFirestore
        .collection("Pets")
        .where("ownerId", isEqualTo: uid)
        .get();
    List<PetModel> listOfPets = querySnapshot.docs
        .map((docs) => docs.data())
        .toList() as List<PetModel>;

    return listOfPets;
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
          participients: meetUpsModel.participients);
      await _firebaseFirestore
          .collection("Meetups")
          .doc(uid)
          .set(meetUp.toMap());
      return "Successfully created a meet-up";
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

      List<MeetUpsModel> listOfMeetups =
          meetUpsCollection.docs.map((e) => MeetUpsModel.fromSnap(e)).toList();
      log("legnth : ${listOfMeetups.length} ");
      return listOfMeetups;
    } on FirebaseException catch (error) {
      throw error.message ?? "An unexpected error occurred";
    }
  }
}
