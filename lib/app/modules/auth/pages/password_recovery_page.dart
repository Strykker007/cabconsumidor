import 'package:cabconsumidor/app/core/shared/widgets/success/success_widget.dart';
import 'package:cabconsumidor/app/modules/auth/stores/password_recovery_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../core/services/helpers.dart';
import '../../../core/shared/widgets/button/default_button_widget.dart';
import '../../../core/shared/widgets/error/request_error_widget.dart';
import '../../../core/shared/widgets/text_field/text_form_field_widget.dart';

class PasswordRecoveryPage extends StatefulWidget {
  const PasswordRecoveryPage({super.key});

  @override
  State<PasswordRecoveryPage> createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {
  final PasswordRecoveryStore store = Modular.get();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Modular.to.pop();
          },
          icon: Icon(
            Icons.close,
            color: Colors.grey.shade600,
            size: 30,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          'Login',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 18),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Theme.of(context).colorScheme.background,
        child: SingleChildScrollView(
          child: TripleBuilder(
            store: store,
            builder: (context, triple) {
              return Column(
                children: [
                  Text(
                    'Digite seu e-mail para realizar a recuperação de sua senha',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.grey.shade600,
                          fontSize: 28,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      height: 5,
                      width: 34,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  TextFormFieldWidget(
                    label: 'EMAIL',
                    labelStyle:
                        Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.grey.shade600,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                    hintText: 'Digite seu e-mail',
                    controller: emailController,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey.shade600,
                          fontSize: 17,
                        ),
                    onChange: (email) {
                      store.updateState(emailController.text);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      recoverPasswordButtonWidget,
                    ],
                  ),

                  // const Spacer(),
                ],
              );
            },
          ),
        ),
      ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 2,
            color: Colors.grey.shade600,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.topCenter,
                  foregroundColor: Theme.of(context).colorScheme.background,
                ),
                onPressed: () {
                  Modular.to.pop();
                },
                child: Text(
                  'Ir para o login',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    shadows: [
                      Shadow(
                        color: Colors.grey.shade600,
                        offset: const Offset(0, -5),
                      ),
                    ],
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.grey.shade600,
                    decorationThickness: 2,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget get recoverPasswordButtonWidget {
    return Expanded(
      child: TripleBuilder(
        store: store,
        builder: (context, triple) {
          return DefaultButtonWidget(
            isLoading: store.isLoading,
            isDisabled: store.state.isEmpty,
            onPressed: () async {
              await store.passwordRecovery(store.state).then(
                (value) async {
                  await Helpers.showDefaultDialog(
                    context,
                    SuccessWidget(
                      label: 'Recuperação de senha',
                      message: 'Sucesso! Enviamos um e-mail com sua nova senha '
                          'para sua caixa de e-mails, caso não encontrar'
                          ' verifique sua caixa de spam!',
                      onPressed: () {
                        Modular.to.pop();
                      },
                    ),
                  );
                  Modular.to.pop();
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
            text: 'Recuperar Senha',
          );
        },
      ),
    );
  }
}
