import 'dart:developer';

import 'package:cabconsumidor/app/core/shared/widgets/appbar/app_bar_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:flutter/material.dart';

import '../../core/shared/widgets/text_field/text_form_field_widget.dart';

class ChangePasswordPage extends StatefulWidget {
  final String? title;
  const ChangePasswordPage({Key? key, required this.title}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void _changePassword() {
    // final String currentPassword = currentPasswordController.text;
    final String newPassword = newPasswordController.text;
    final String confirmPassword = confirmPasswordController.text;

    if (newPassword != confirmPassword) {
      log("New password and confirm password do not match!");
      return;
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
              child: DefaultButtonWidget(
                isDisabled: false,
                isLoading: false,
                onPressed: _changePassword,
                text: 'Alterar senha',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
