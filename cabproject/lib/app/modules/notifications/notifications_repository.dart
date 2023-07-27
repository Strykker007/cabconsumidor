import 'package:cabproject/app/core/models/notifications_model.dart';
import 'package:cabproject/app/core/services/firebase_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NotificationsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<NotificationsModel>> getNotificationsList() async {
    List<NotificationsModel> notifications = List.empty(growable: true);
    try {
      await _firestore.collection('notifications').get().then(
        (snapshots) {
          for (var element in snapshots.docs) {
            notifications.add(NotificationsModel.fromMap(element.data()));
          }
        },
      );
      return notifications;
    } on FirebaseAuthException catch (e) {
      final Exception error = FirebaseExceptions.getErrorException(e);
      throw error;
    }
  }
}
