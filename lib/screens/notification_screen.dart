import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/NotificationModel.dart';
import '../repository/appointment_repository.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  String uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: FutureBuilder(
        future: AppointmentRepository().getAllNotification(receiverId: uid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NotificationModel> notificationsList = snapshot.data!;
            return ListView.builder(
              itemCount: notificationsList.length,
              itemBuilder: (context, index) => Card(
                elevation: 4,
                child: ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: Colors.amber,
                  ),
                  title: Text(
                    "${notificationsList[index].notificationMessage}",
                  ),
                  subtitle: Text("at ${notificationsList[index].timeStamp}"),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
