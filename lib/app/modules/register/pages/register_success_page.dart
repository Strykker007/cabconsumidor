import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class RegisterSuccessPage extends StatelessWidget {
  const RegisterSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Lottie.asset(
              'assets/lottie/success.json',
              height: 200,
            ),
            Text(
              'Usuário criado com sucesso!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            DefaultButtonWidget(
              text: 'Ir para o login',
              isDisabled: false,
              onPressed: () {
                Modular.to.pop();
                Modular.to.pop();
              },
              isLoading: false,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
