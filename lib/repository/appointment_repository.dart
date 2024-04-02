import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_appointment_app/models/appointment_model.dart';
import 'package:uuid/uuid.dart';

class AppointmentRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final uuid = Uuid();

  //Create Appointments
  Future<String> createAppointment(
      {required String userId,
      required String doctorId,
      required String petId,
      required AppointmentModel appointmentModel,
      required String dateTime}) async {
    try {
      String appId = uuid.v4();
      AppointmentModel newAppointmentModel = AppointmentModel(
          appointmentId: appId,
          petId: petId,
          userId: userId,
          doctorId: doctorId,
          dateTime: dateTime,
          status: "pending");
      await _firebaseFirestore
          .collection("Appointments")
          .doc(petId)
          .set(newAppointmentModel.toMap());

      await _firebaseFirestore.collection("Users").doc(userId).update({
        "appointments":
            FieldValue.arrayUnion([newAppointmentModel.appointmentId])
      });
      return "Appointment created";
    } on FirebaseException catch (error) {
      return "${error.message}";
    }
  }

// Get appointment by Id
  Future<AppointmentModel> getAppointmentById(
      {required String appointmentId}) async {
    final appointnment = await _firebaseFirestore
        .collection("Appointments")
        .doc(appointmentId)
        .get();
    return AppointmentModel.fromSnap(appointnment);
  }

// List of all appointment requests to doctor

  Future<List<AppointmentModel>> getAllAppointmentRequestedTodoctor(
      {required String doctorId}) async {
    QuerySnapshot querySnapshot = await _firebaseFirestore
        .collection("Appointments")
        .where("doctorId", isEqualTo: doctorId)
        .where("status", isEqualTo: "pending")
        .get();
    List<AppointmentModel> listOfAllAppointments = querySnapshot.docs
        .map((doc) => AppointmentModel.fromSnap(doc))
        .toList();

    return listOfAllAppointments;
  }

  // List of all accepted appointment by doctorId

  Future<List<AppointmentModel>> getAllAppointmentAcceptedByDoctorId(
      {required String doctorId}) async {
    QuerySnapshot querySnapshot = await _firebaseFirestore
        .collection("Appointments")
        .where("doctorId", isEqualTo: doctorId)
        .where("status", isEqualTo: "accepted")
        .get();
    List<AppointmentModel> listOfAllAppointments = querySnapshot.docs
        .map((doc) => AppointmentModel.fromSnap(doc))
        .toList();

    return listOfAllAppointments;
  }

// Accept appointment by doctor
  Future<String> acceptAppointmentByDoctor({
    required AppointmentModel appointmentModel,
  }) async {
    try {
      await _firebaseFirestore
          .collection("Appointments")
          .doc(appointmentModel.appointmentId)
          .update({"status": "accepted"});

      return "Appointment removed";
    } on FirebaseException catch (error) {
      return "${error.message}";
    }
  }

  // Reject appointment by doctor
  Future<String> rejectAppointmentByDoctor({
    required AppointmentModel appointmentModel,
  }) async {
    try {
      await _firebaseFirestore
          .collection("Appointments")
          .doc(appointmentModel.appointmentId)
          .delete();
      await _firebaseFirestore
          .collection("Users")
          .doc(appointmentModel.userId)
          .update({
        "appointments": FieldValue.arrayRemove([appointmentModel.appointmentId])
      });

      return "Appointment removed";
    } on FirebaseException catch (error) {
      return "${error.message}";
    }
  }
}
