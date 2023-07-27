import 'package:cabproject/app/core/models/register_model.dart';
import 'package:cabproject/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabproject/app/core/shared/widgets/text_field/text_form_field_widget.dart';
import 'package:cabproject/app/core/stores/obscure_store.dart';
import 'package:cabproject/app/modules/register/stores/checkbox_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cabproject/app/modules/register/stores/register_store.dart';
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
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailConfirmController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ObscureStore obscureStore = ObscureStore();
  bool isChecked = false;

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
      body: TripleBuilder<RegisterStore, RegisterModel>(
        store: store,
        builder: (context, triple) {
          return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Theme.of(context).colorScheme.background,
                child: Align(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                          alignment: Alignment.centerLeft,
                          child: Container(
                            height: 5,
                            width: 34,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const Spacer(),
                        TextFormFieldWidget(
                          label: 'CPF',
                          onChange: (cpf) {
                            store.state.cpf = cpf;
                            // store.updateForm(store.state);
                          },
                          labelStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey.shade600,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                          hintText: 'Digite seu cpf',
                          controller: cpfController,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                          },
                          labelStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey.shade600,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                          hintText: 'Digite seu telefone',
                          controller: phoneController,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                }),
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
                            const SizedBox(width: 10),
                          ],
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
                          height: 40,
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
              ),
            ),
          );
        },
      ),
    );
  }

  Widget get registerButtonWidget {
    return Expanded(
      child: DefaultButtonWidget(
        isDisabled: false,
        isLoading: store.isLoading,
        onPressed: () async {
          store.registerUser(store.state);
        },
        text: 'Cadastrar',
      ),
    );
  }
}
