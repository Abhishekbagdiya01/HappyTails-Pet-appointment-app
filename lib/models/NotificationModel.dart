import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  String senderId;
  String receiverId;
  String notificationMessage;
  String timeStamp;
  NotificationModel({
    required this.senderId,
    required this.receiverId,
    required this.notificationMessage,
    required this.timeStamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'receiverId': receiverId,
      'notificationMessage': notificationMessage,
      'timeStamp': timeStamp
    };
  }

  factory NotificationModel.fromMap(DocumentSnapshot documentSnapshot) {
    final snap = documentSnapshot.data() as Map<String, dynamic>;
    return NotificationModel(
        senderId: snap['senderId'],
        receiverId: snap['receiverId'],
        notificationMessage: snap['notificationMessage'],
        timeStamp: snap['timeStamp']);
  }
}
