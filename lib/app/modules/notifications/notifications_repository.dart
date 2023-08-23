import 'package:cabconsumidor/app/core/models/notifications_model.dart';
import 'package:dio/dio.dart';

class NotificationsRepository {
  final Dio client;

  NotificationsRepository(this.client);

  Future<List<NotificationsModel>> getNotificationsList(String userId) async {
    List<NotificationsModel> notifications = List.empty(growable: true);
    try {
      final response =
          await client.get('/notificacao/', data: {'id_consumidor': userId});

      response.data.forEach(
        (element) {
          notifications.add(NotificationsModel.fromMap(element));
        },
      );
      return notifications;
    } catch (onError) {
      rethrow;
    }
  }
}
