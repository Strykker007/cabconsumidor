import 'package:cabproject/app/core/models/notifications_model.dart';
import 'package:cabproject/app/modules/notifications/notifications_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class NotificationsStore extends Store<List<NotificationsModel>> {
  NotificationsStore() : super([]);

  final NotificationsRepository _repository = Modular.get();

  Future<void> getNotificationsList() async {
    setLoading(true);
    await _repository.getNotificationsList().then(
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
