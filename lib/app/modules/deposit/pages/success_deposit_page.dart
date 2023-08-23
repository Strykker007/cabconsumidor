import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class SuccessDepositPage extends StatefulWidget {
  const SuccessDepositPage({super.key});

  @override
  State<SuccessDepositPage> createState() => _SuccessDepositPageState();
}

class _SuccessDepositPageState extends State<SuccessDepositPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          Lottie.asset(
            'assets/lottie/success.json',
            height: 200,
          ),
          Text(
            'Seu depósito foi realizado com sucesso!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          DefaultButtonWidget(
            text: 'Voltar para o início',
            isDisabled: false,
            onPressed: () {
              Modular.to.pop();
            },
            isLoading: false,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
