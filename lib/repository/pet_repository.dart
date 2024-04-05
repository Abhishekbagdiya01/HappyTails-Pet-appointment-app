import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_appointment_app/models/pet_model.dart';
import 'package:uuid/uuid.dart';

class PetRepository {
  /*PETS*/
//create pet profie
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final uuid = Uuid();

  Future createPetProfile({required PetModel petModel}) async {
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
    DocumentSnapshot pet =
        await _firebaseFirestore.collection("Pets").doc(petId).get();
    return PetModel.fromSnap(pet);
  }

  //remove pet profie

  Future deletePetProfile({required String petId}) async {
    try {
      await _firebaseFirestore.collection("Pets").doc(petId).delete();
      return "Pet removed";
    } on FirebaseException catch (error) {
      return "${error.message}";
    }
  }

//Get all pets by uid
  Future<List<PetModel>> getAllPetByUid(String uid) async {
    try {
      QuerySnapshot querySnapshot = await _firebaseFirestore
          .collection("Pets")
          .where("ownerId", isEqualTo: uid)
          .get();
      List<PetModel> listOfPets = [];
      querySnapshot.docs.forEach((docs) {
        listOfPets.add(PetModel.fromSnap(docs));
      });

      print("PET NAME :  ${listOfPets[0].petName}");
      return listOfPets;
    } on FirebaseException catch (error) {
      throw error.message ?? "Something went wrong";
    }
  }
}
