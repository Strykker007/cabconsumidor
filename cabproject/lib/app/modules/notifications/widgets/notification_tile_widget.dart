import 'package:cabproject/app/core/models/notifications_model.dart';
import 'package:flutter/material.dart';

class NotificationTileWidget extends StatelessWidget {
  final NotificationsModel model;
  const NotificationTileWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        model.title!,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
      ),
      subtitle: Text(
        model.body!,
      ),
    );
  }
}
