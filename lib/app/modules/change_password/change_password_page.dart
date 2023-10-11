import 'dart:developer';

import 'package:cabconsumidor/app/core/services/helpers.dart';
import 'package:cabconsumidor/app/core/shared/widgets/appbar/app_bar_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/error/request_error_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/success/success_widget.dart';
import 'package:cabconsumidor/app/modules/change_password/change_password_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../core/shared/widgets/text_field/text_form_field_widget.dart';

class ChangePasswordPage extends StatefulWidget {
  final String? title;
  const ChangePasswordPage({Key? key, required this.title}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final ChangePasswordStore store = Modular.get();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();

  void _changePassword() async {
    // final String currentPassword = currentPasswordController.text;
    if (_formKey.currentState!.validate()) {
      await store.changePassword().then((value) {
        Helpers.showDefaultDialog(
          context,
          SuccessWidget(
            message: 'Senha alterada com sucesso!',
            onPressed: () {
              Modular.to.pop();
            },
          ),
        );
      }).catchError(
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: widget.title,
        backgroundColor: Colors.transparent,
      ).build(context) as AppBar,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormFieldWidget(
                controller: currentPasswordController,
                suffixIcon: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Theme.of(context).primaryColor,
                ),
                label: 'Senha atual',
                onChange: (oldPassword) {
                  store.state.oldPassword = oldPassword;
                  store.updateForm(store.state);
                },
                labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                borderColor: Theme.of(context).primaryColor,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
              ),
              TextFormFieldWidget(
                controller: newPasswordController,
                suffixIcon: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Theme.of(context).primaryColor,
                ),
                label: 'Nova senha',
                labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                onChange: (newPassword) {
                  store.state.newPassword = newPassword;
                  store.updateForm(store.state);
                },
                borderColor: Theme.of(context).primaryColor,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
              ),
              TextFormFieldWidget(
                controller: confirmPasswordController,
                suffixIcon: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Theme.of(context).primaryColor,
                ),
                label: 'Confirme a nova senha',
                labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                onChange: (confirmPassword) {
                  store.state.confirmPassword = confirmPassword;
                  store.updateForm(store.state);
                  _formKey.currentState!.validate();
                },
                validator: (newPassword) {
                  if (store.state.newPassword!.isNotEmpty &&
                      store.state.confirmPassword!.isNotEmpty) {
                    if (store.state.newPassword! !=
                        store.state.confirmPassword!) {
                      return 'A senhas não conferem';
                    } else {
                      return null;
                    }
                  }
                  return null;
                },
                borderColor: Theme.of(context).primaryColor,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: TripleBuilder(
                  store: store,
                  builder: (context, triple) {
                    return DefaultButtonWidget(
                      isDisabled: store.validateFields(),
                      isLoading: false,
                      onPressed: _changePassword,
                      text: 'Alterar senha',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
