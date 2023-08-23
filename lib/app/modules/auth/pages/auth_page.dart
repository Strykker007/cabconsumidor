import 'package:cabconsumidor/app/core/services/helpers.dart';
import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/error/request_error_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/text_field/text_form_field_widget.dart';
import 'package:cabconsumidor/app/core/stores/obscure_store.dart';
import 'package:cabconsumidor/app/modules/auth/stores/remind_password_store.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:cabconsumidor/app/modules/auth/stores/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutter/cupertino.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  final RemindPasswordStore passwordStore = Modular.get();
  final AuthStore store = Modular.get();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberPassword = false;
  @override
  void initState() {
    passwordStore.getUserCredentialSaved().then(
      (value) {
        if (passwordStore.credential!.username != null) {
          passwordStore.updateState(true);
        }
        if (passwordStore.state) {
          emailController.text = passwordStore.credential!.username!;
          passwordController.text = passwordStore.credential!.password!;
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: SingleChildScrollView(
        child: TripleBuilder<AuthStore, bool>(
          store: store,
          builder: (context, triple) {
            return Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(10),
              color: Theme.of(context).colorScheme.background,
              child: Align(
                child: Column(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Text(
                            'Entre na sua conta e veja seus ganhos',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 28,
                                ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 5,
                              width: 34,
                              color: Colors.grey,
                            ),
                          ),
                          const Spacer(),
                          TextFormFieldWidget(
                            label: 'EMAIL',
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                            hintText: 'Digite seu e-mail',
                            controller: emailController,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 17,
                                ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TripleBuilder<ObscureStore, bool>(
                            store: store.obscureStore,
                            builder: (_, obscure) {
                              return TextFormFieldWidget(
                                hintText: 'Senha',
                                label: 'SENHA',
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.grey.shade600,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                    ),
                                controller: passwordController,
                                obscureText: store.obscureStore.state,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.grey.shade600,
                                    ),
                                // suffixIcon: IconButton(
                                //   icon: Icon(
                                //     store.obscureStore.state
                                //         ? Icons.visibility_off
                                //         : Icons.visibility,
                                //     color: Theme.of(context).colorScheme.background,
                                //   ),
                                //   onPressed: () {
                                //     store.obscurePassword();
                                //   },
                                // ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Lembrar da senha',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color: Colors.grey.shade600,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(width: 10),
                              TripleBuilder(
                                store: passwordStore,
                                builder: (_, triple) {
                                  return CupertinoSwitch(
                                    thumbColor: Colors.white,
                                    activeColor: Theme.of(context).primaryColor,
                                    onChanged: (bool value) {
                                      passwordStore.update(value);
                                      if (value == false) {
                                        passwordStore
                                            .clearUserCredentialSaved();
                                      }
                                    },
                                    value: passwordStore.state,
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              authButtonWidget,
                            ],
                          ),
                          const Spacer(),
                          Divider(
                            thickness: 2,
                            color: Colors.grey.shade600,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ainda não tem conta? ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        fontSize: 13,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    alignment: Alignment.topCenter,
                                    foregroundColor: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                                  onPressed: () {
                                    Modular.to
                                        .pushReplacementNamed('/register');
                                  },
                                  child: Text(
                                    'Cadatrar',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget get authButtonWidget {
    return Expanded(
      child: DefaultButtonWidget(
        isLoading: store.isLoading,
        isDisabled: false,
        onPressed: () async {
          store.credentialModel.username = emailController.text;
          store.credentialModel.password = passwordController.text;
          await store.authenticate(store.credentialModel).then(
            (value) {
              if (passwordStore.state) {
                passwordStore.setUserCredentialSaved(store.credentialModel);
              }
              Modular.to.pushReplacementNamed('/auth/home/');
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
        text: 'Entrar',
      ),
    );
  }
}
