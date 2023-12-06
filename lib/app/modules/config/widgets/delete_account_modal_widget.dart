import 'package:cabconsumidor/app/core/shared/widgets/success/success_widget.dart';
import 'package:cabconsumidor/app/modules/config/stores/config_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/enums/buttons_enum.dart';
import '../../../core/services/helpers.dart';
import '../../../core/services/logout_service.dart';
import '../../../core/shared/widgets/button/default_button_widget.dart';
import '../../../core/shared/widgets/error/request_error_widget.dart';

class DeleteAccountModalWidget extends StatefulWidget {
  const DeleteAccountModalWidget({Key? key}) : super(key: key);

  @override
  State<DeleteAccountModalWidget> createState() =>
      _DeleteAccountModalWidgetState();
}

class _DeleteAccountModalWidgetState extends State<DeleteAccountModalWidget> {
  final ConfigStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const Icon(
                      Icons.warning_rounded,
                      color: Colors.amber,
                      size: 45,
                    ),
                    Text(
                      'Confirmação',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Deseja realmente excluir sua conta?',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      '* Ao excluir sua conta, você perderá todos os'
                      ' seus dados e não poderá mais acessar o aplicativo!',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.red,
                          ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 25),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () async {
                                  await store.deleteUser().then(
                                    (value) {
                                      Modular.to.pop();
                                      Helpers.showDefaultDialog(
                                        context,
                                        SuccessWidget(
                                          message:
                                              'Conta excluída com sucesso!',
                                          onPressed: () {
                                            Modular.to.pop();
                                            LogoutService.logout();
                                          },
                                        ),
                                      );
                                    },
                                  ).catchError(
                                    (onError) {
                                      Helpers.showDefaultDialog(
                                        context,
                                        RequestErrorWidget(
                                          error: onError,
                                          buttonText: 'Fechar',
                                          onPressed: () {
                                            Modular.to.pop();
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Excluir',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: DefaultButtonWidget(
                                buttonType: DefaultButtonType.outline,
                                text: 'Cancelar',
                                onPressed: () {
                                  Modular.to.pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
