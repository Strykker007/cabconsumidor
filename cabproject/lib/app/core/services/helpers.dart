import 'package:cabproject/app/core/shared/widgets/text_field/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Helpers {
  static Future<void> showDefaultDialog(
    BuildContext context,
    Widget child, {
    bool showClose = false,
  }) async {
    await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (_, animation, secondaryAnimation) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).cardColor,
                      width: 0.05,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: -5,
                        color: Theme.of(context).cardColor.withOpacity(0.5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Material(
                      color: Colors.transparent,
                      child: child,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> recoverPasswordDialog(
    BuildContext context, {
    onPressed,
  }) async {
    final TextEditingController emailController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Recuperar senha',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  )),
          content: TextFormFieldWidget(
            controller: emailController,
            iconData: const Icon(
              Icons.email,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Modular.to.pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: onPressed,
              child: const Text('Enviar'),
            ),
          ],
        );
      },
    );
  }

  static Future<void> showErrorDialog(
    String message,
    BuildContext context, {
    onPressed,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            message,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Modular.to.pop();
              },
              child: Text(
                'Fechar',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
              ),
            ),
          ],
        );
      },
    );
  }
}
