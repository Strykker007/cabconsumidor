import 'package:cabproject/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 150),
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          child: Image.asset(
                            'assets/images/cab.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            'A plataforma que faz o seu dinheiro render mais.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 24,
                                  color: Colors.grey,
                                ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 5,
                          width: 34,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: DefaultButtonWidget(
                                text: 'Entrar',
                                isDisabled: false,
                                onPressed: () {
                                  Modular.to.pushNamed('/auth/login');
                                },
                                isLoading: false,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: DefaultButtonWidget(
                                text: 'Cadastrar',
                                isDisabled: false,
                                onPressed: () {
                                  Modular.to.pushNamed('/register');
                                },
                                isLoading: false,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Divider(
                          thickness: 2,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Consumidor',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
