import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class SuccessPaymentPage extends StatelessWidget {
  const SuccessPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/success.json',
              height: 200,
            ),
            Text(
              'Seu pagamento foi realizado com sucesso!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            DefaultButtonWidget(
              text: 'Voltar',
              isDisabled: false,
              onPressed: () {
                Modular.to.pop();
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
