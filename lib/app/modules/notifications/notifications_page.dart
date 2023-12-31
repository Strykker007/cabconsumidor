import 'package:cabconsumidor/app/core/shared/widgets/appbar/app_bar_widget.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:cabconsumidor/app//modules/notifications/notifications_store.dart';
import 'package:cabconsumidor/app/core/enums/buttons_enum.dart';
import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/loading/loading_widget.dart';
import 'package:cabconsumidor/app/modules/notifications/widgets/notification_tile_widget.dart';

class NotificationsPage extends StatefulWidget {
  final String title;
  const NotificationsPage({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  NotificationsPageState createState() => NotificationsPageState();
}

class NotificationsPageState extends State<NotificationsPage> {
  final NotificationsStore store = Modular.get();
  final UserStore userStore = Modular.get();

  @override
  void initState() {
    store.getNotificationsList(userStore.state.user!.userId!.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: widget.title,
        backgroundColor: Colors.transparent,
      ).build(context) as AppBar,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: TripleBuilder(
                store: store,
                builder: (context, triple) {
                  if (triple.isLoading) {
                    return const LoadingWidget();
                  }
                  if (store.state.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Nenhuma notificação encontrada!'),
                          const SizedBox(height: 10),
                          DefaultButtonWidget(
                            buttonType: DefaultButtonType.outline,
                            text: 'Atualizar',
                            onPressed: () async {
                              await store.getNotificationsList(
                                userStore.state.user!.userId!.toString(),
                              );
                            },
                            isLoading: false,
                            isDisabled: false,
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: store.state.length,
                    separatorBuilder: (context, index) {
                      return Divider(color: Colors.grey.shade600);
                    },
                    itemBuilder: (context, index) {
                      return NotificationTileWidget(model: store.state[index]);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
