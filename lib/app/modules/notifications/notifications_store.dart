import 'package:cabconsumidor/app/core/models/notifications_model.dart';
import 'package:cabconsumidor/app/modules/notifications/notifications_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class NotificationsStore extends Store<List<NotificationsModel>> {
  NotificationsStore() : super([]);

  final NotificationsRepository _repository = Modular.get();

  Future<void> getNotificationsList(String userId) async {
    setLoading(true);
    await _repository.getNotificationsList(userId).then(
      (notifications) {
        setLoading(false);
        update(notifications);
      },
    ).catchError((onError) {
      setLoading(false);
      throw onError;
    });
  }
}
