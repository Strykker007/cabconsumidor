import 'package:cabproject/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class SuccessPaymentPage extends StatelessWidget {
  const SuccessPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        Lottie.asset(
          'assets/lottie/success.json',
          height: 200,
        ),
        const Text('Seu pagamento foi realizado com sucesso!'),
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        DefaultButtonWidget(
          text: 'Voltar para o início',
          isDisabled: false,
          onPressed: () {
            Modular.to.pushNamed('/home');
          },
          isLoading: false,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
