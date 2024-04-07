import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_appointment_app/models/NotificationModel.dart';
import 'package:pet_appointment_app/models/appointment_model.dart';
import 'package:uuid/uuid.dart';

class AppointmentRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final uuid = Uuid();

  //Create Appointments
  Future<String> createAppointment({
    required AppointmentModel appointmentModel,
  }) async {
    try {
      String appointmentId = uuid.v4();
      AppointmentModel newAppointmentModel = AppointmentModel(
          appointmentId: appointmentId,
          petId: appointmentModel.petId,
          userId: appointmentModel.userId,
          doctorId: appointmentModel.doctorId,
          petName: appointmentModel.petName,
          date: appointmentModel.date,
          time: appointmentModel.time,
          diseases: appointmentModel.diseases,
          amountOfFeeding: appointmentModel.amountOfFeeding,
          brandOfFood: appointmentModel.brandOfFood,
          typeOfTreats: appointmentModel.typeOfTreats,
          status: "pending");
      await _firebaseFirestore
          .collection("Appointments")
          .doc(newAppointmentModel.appointmentId)
          .set(newAppointmentModel.toMap());

      await _firebaseFirestore
          .collection("Users")
          .doc(appointmentModel.userId)
          .update({
        "appointments":
            FieldValue.arrayUnion([newAppointmentModel.appointmentId])
      });
      NotificationModel notificationModel = NotificationModel(
          senderId: appointmentModel.userId,
          receiverId: appointmentModel.doctorId,
          notificationMessage: "New appointment received",
          timeStamp:
              "${DateTime.now().hour % 12 == 0 ? 12 : DateTime.now().hour % 12} : ${DateTime.now().minute.toString().padLeft(2, '0')} ${DateTime.now().hour < 12 ? 'AM' : 'PM'} ");
      await _firebaseFirestore
          .collection("Notifications")
          .doc()
          .set(notificationModel.toMap());
      return "Appointment submitted";
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

  // Get all appointment by pet Id

  Future<List<AppointmentModel>> getAllAppointmentByPetId(
      {required String petId}) async {
    QuerySnapshot querySnapshot = await _firebaseFirestore
        .collection("Appointments")
        .where("petId", isEqualTo: petId)
        .get();
    List<AppointmentModel> listOfAllAppointments = querySnapshot.docs
        .map((doc) => AppointmentModel.fromSnap(doc))
        .toList();

    return listOfAllAppointments;
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
      NotificationModel notificationModel = NotificationModel(
          senderId: appointmentModel.doctorId,
          receiverId: appointmentModel.userId,
          notificationMessage: "Your appointment accepted",
          timeStamp:
              "${DateTime.now().hour % 12 == 0 ? 12 : DateTime.now().hour % 12} : ${DateTime.now().minute.toString().padLeft(2, '0')} ${DateTime.now().hour < 12 ? 'AM' : 'PM'} ");
      await _firebaseFirestore
          .collection("Notifications")
          .doc()
          .set(notificationModel.toMap());

      return "Appointment accepted";
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
      NotificationModel notificationModel = NotificationModel(
          senderId: appointmentModel.doctorId,
          receiverId: appointmentModel.userId,
          notificationMessage: "Your appointment rejected",
          timeStamp:
              "${DateTime.now().hour % 12 == 0 ? 12 : DateTime.now().hour % 12} : ${DateTime.now().minute.toString().padLeft(2, '0')} ${DateTime.now().hour < 12 ? 'AM' : 'PM'} ");
      await _firebaseFirestore
          .collection("Notifications")
          .doc()
          .set(notificationModel.toMap());

      return "Appointment removed";
    } on FirebaseException catch (error) {
      return "${error.message}";
    }
  }

  // Fetch all notification
  Future<List<NotificationModel>> getAllNotification(
      {required String receiverId}) async {
    try {
      QuerySnapshot querySnapshot = await _firebaseFirestore
          .collection("Notifications")
          .where('receiverId', isEqualTo: receiverId)
          .get();
      List<NotificationModel> listOfNotifications = querySnapshot.docs
          .map((docs) => NotificationModel.fromMap(docs))
          .toList();

      return listOfNotifications;
    } on FirebaseException catch (error) {
      return throw error.message.toString();
    }
  }
}
