import 'dart:developer';

import 'package:cabconsumidor/app/core/models/register_model.dart';
import 'package:cabconsumidor/app/core/services/helpers.dart';
import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/error/request_error_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/text_field/text_form_field_widget.dart';
import 'package:cabconsumidor/app/core/stores/obscure_store.dart';
import 'package:cabconsumidor/app/core/utils/masks.dart';
import 'package:cabconsumidor/app/modules/register/stores/checkbox_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cabconsumidor/app/modules/register/stores/register_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key? key, this.title = 'RegisterPage'}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final RegisterStore store = Modular.get();
  final CheckboxStore checkboxStore = Modular.get();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailConfirmController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ObscureStore obscureStore = ObscureStore();
  bool isChecked = false;

  @override
  void initState() {
    log(Modular.to.navigateHistory.first.name);
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
          'Cadastrar',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: TripleBuilder<RegisterStore, RegisterModel>(
          store: store,
          builder: (context, triple) {
            return Container(
              padding: const EdgeInsets.all(10),
              color: Theme.of(context).colorScheme.background,
              child: Align(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'Obtenha dinheiro de volta a cada compra',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 28,
                                ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 5,
                          width: 34,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      TextFormFieldWidget(
                        label: 'NOME',
                        onChange: (name) {
                          store.state.name = name;
                          store.updateForm(store.state);
                        },
                        labelStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                        hintText: 'Digite seu cpf',
                        controller: nameController,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.grey.shade600,
                              fontSize: 17,
                            ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldWidget(
                        label: 'CPF',
                        onChange: (cpf) {
                          store.state.cpf = cpf;
                          store.updateForm(store.state);
                        },
                        inputFormatters: [
                          Masks.generateMask('###.###.###-##'),
                        ],
                        labelStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                        hintText: 'Digite seu cpf',
                        controller: cpfController,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.grey.shade600,
                              fontSize: 17,
                            ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldWidget(
                        label: 'EMAIL',
                        onChange: (email) {
                          store.state.email = email;
                          store.updateForm(store.state);
                        },
                        labelStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                        hintText: 'Digite seu e-mail',
                        controller: emailController,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.grey.shade600,
                              fontSize: 17,
                            ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldWidget(
                        label: 'CONFIRME O EMAIL',
                        labelStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                        hintText: 'Confirme seu e-mail',
                        controller: emailConfirmController,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.grey.shade600,
                              fontSize: 17,
                            ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldWidget(
                        label: 'CELULAR',
                        onChange: (phone) {
                          store.state.phone = phone;
                          store.updateForm(store.state);
                        },
                        inputFormatters: [
                          Masks.generateMask('(##) #####-####'),
                        ],
                        labelStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                        hintText: 'Digite seu telefone',
                        controller: phoneController,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.grey.shade600,
                              fontSize: 17,
                            ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldWidget(
                        label: 'DATA DE NASCIMENTO',
                        onChange: (phone) {
                          store.state.phone = phone;
                          store.updateForm(store.state);
                        },
                        inputFormatters: [
                          Masks.generateMask('##/##/####'),
                        ],
                        labelStyle:
                            Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                        hintText: 'Digite sua data de nascimento',
                        controller: birthDateController,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.grey.shade600,
                              fontSize: 17,
                            ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TripleBuilder<ObscureStore, bool>(
                        store: obscureStore,
                        builder: (_, obscure) {
                          return TextFormFieldWidget(
                            hintText: 'Senha',
                            label: 'SENHA',
                            onChange: (password) {
                              store.state.password = password;
                            },
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.grey.shade600,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                            controller: passwordController,
                            obscureText: obscureStore.state,
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
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            children: [
                              TripleBuilder(
                                store: checkboxStore,
                                builder: (context, triple) {
                                  return Checkbox(
                                    checkColor: Colors.white,
                                    fillColor: MaterialStateProperty.all(
                                        Colors.grey.shade600),
                                    value: checkboxStore.state,
                                    shape: const CircleBorder(),
                                    onChanged: (bool? value) {
                                      checkboxStore
                                          .updateState(!checkboxStore.state);
                                    },
                                  );
                                },
                              ),
                              Text(
                                'Eu aceito os termos e condições',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color: Colors.grey.shade600,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          TripleBuilder(
                            store: store,
                            builder: (context, triple) {
                              return registerButtonWidget;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Já é cadastrado? ',
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
                              foregroundColor:
                                  Theme.of(context).colorScheme.background,
                            ),
                            onPressed: () {
                              Modular.to.pushReplacementNamed('/auth/login');
                            },
                            child: Text(
                              'Login',
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
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget get registerButtonWidget {
    return Expanded(
      child: DefaultButtonWidget(
        isDisabled: false,
        isLoading: store.isLoading,
        onPressed: () async {
          // Modular.to.pushNamed('/register/register_success_page');

          await store.registerUser(store.state).then((value) {
            Modular.to.pushNamed('/register_success_page/');
          }).catchError((onError) {
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
          });
        },
        text: 'Cadastrar',
      ),
    );
  }
}
