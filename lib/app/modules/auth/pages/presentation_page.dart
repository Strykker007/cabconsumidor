import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PresentationPage extends StatelessWidget {
  const PresentationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 200,
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
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
              Column(
                children: [
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
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Text(
              'Consumidor',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
