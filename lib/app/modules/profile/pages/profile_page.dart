import 'package:cabconsumidor/app/core/services/formatters.dart';
import 'package:cabconsumidor/app/core/services/helpers.dart';
import 'package:cabconsumidor/app/core/shared/widgets/appbar/app_bar_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/error/request_error_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/profile_photo/profile_photo_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/success/success_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/text_field/text_form_field_widget.dart';
import 'package:cabconsumidor/app/core/utils/masks.dart';
import 'package:cabconsumidor/app/modules/profile/profile_store.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key? key, this.title = 'ProfilePage'}) : super(key: key);
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final ProfileStore store = Modular.get();

  final ImagePicker pickerService = ImagePicker();
  final ImageCropper imageCropper = ImageCropper();
  Masks mask = Masks();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    nameController.text = store.userStore.state.user!.name ?? '';
    cpfController.text = Formatters.formatCPF(store.userStore.state.user!.cpf!);
    emailController.text = store.userStore.state.user!.email ?? '';
    phoneController.text =
        Formatters.formatPhone(store.userStore.state.user!.phone!);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: widget.title,
        backgroundColor: Colors.transparent,
      ).build(context) as AppBar,
      body: TripleBuilder(
          store: store,
          builder: (context, triple) {
            return Stack(
              children: [
                Visibility(
                  visible: triple.isLoading,
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircularProgressIndicator.adaptive(),
                          const SizedBox(height: 15),
                          Text(
                            'Salvando foto...',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 3,
                                    ),
                                  ),
                                  child: TripleBuilder(
                                    store: store.userStore,
                                    builder: (_, triple) {
                                      if (triple.isLoading) {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        );
                                      }
                                      return const ProfilePhotoWidget();
                                    },
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(0),
                                    margin: const EdgeInsets.all(0),
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.amber,
                                      // gradient: LinearGradient(
                                      //   colors: [
                                      //     Colors.orange,
                                      //     Colors.grey.shade300,
                                      //   ],
                                      // ),
                                    ),
                                    child: IconButton(
                                      padding: const EdgeInsets.all(0),
                                      onPressed: () async {
                                        _showPhotoSourceBottomSheet();
                                      },
                                      icon: const Icon(
                                        Icons.add_outlined,
                                        size: 20,
                                      ),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 50),
                          Text(
                            'Dados pessoais',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          TextFormFieldWidget(
                            controller: nameController,
                            suffixIcon: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Theme.of(context).primaryColor,
                            ),
                            label: 'NOME',
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                            onChange: (name) {
                              store.userStore.state.user!.name = name;
                            },
                            borderColor: Theme.of(context).primaryColor,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                          ),
                          TextFormFieldWidget(
                            controller: cpfController,
                            suffixIcon: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Theme.of(context).primaryColor,
                            ),
                            onChange: (cpf) {
                              store.userStore.state.user!.cpf =
                                  cpf!.replaceAll(RegExp(r'[.-]'), '');
                            },
                            inputFormatters: [mask.cpf],
                            label: 'CPF',
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                            borderColor: Theme.of(context).primaryColor,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                          ),
                          TextFormFieldWidget(
                            controller: emailController,
                            suffixIcon: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Theme.of(context).primaryColor,
                            ),
                            onChange: (email) {
                              store.userStore.state.user!.email = email;
                            },
                            label: 'E-MAIL',
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                            borderColor: Theme.of(context).primaryColor,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                          ),
                          TextFormFieldWidget(
                            controller: phoneController,
                            suffixIcon: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Theme.of(context).primaryColor,
                            ),
                            onChange: (phone) {
                              store.userStore.state.user!.phone =
                                  phone!.replaceAll(RegExp(r'[^\d]'), '');
                            },
                            inputFormatters: [
                              Masks.generateMask('(##) #####-####')
                            ],
                            label: 'TELEFONE',
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                            borderColor: Theme.of(context).primaryColor,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: TripleBuilder(
                              store: store.userStore,
                              builder: (_, triple) {
                                return DefaultButtonWidget(
                                  text: 'Salvar',
                                  isDisabled: false,
                                  onPressed: () async {
                                    await store
                                        .updateUserProfile(
                                      store.userStore.state.user!.userId!
                                          .toString(),
                                      store.userStore.state.user!,
                                    )
                                        .then(
                                      (value) {
                                        Helpers.showDefaultDialog(
                                          context,
                                          SuccessWidget(
                                            label: 'Sucesso',
                                            message: 'Informações atualizadas!',
                                            onPressed: () {
                                              Modular.to.pop();
                                            },
                                          ),
                                        );
                                      },
                                    ).catchError(
                                      (onError) {
                                        Helpers.showDefaultDialog(
                                          context,
                                          RequestErrorWidget(
                                            buttonText: 'Fechar',
                                            error: onError,
                                            onPressed: () {
                                              Modular.to.pop();
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  isLoading: store.userStore.isLoading,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  void _showPhotoSourceBottomSheet() {
    showModalBottomSheet(
      context: context,
      isDismissible: true,

      backgroundColor: Colors.transparent,
      // isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Selecione uma opção',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black.withOpacity(0.6),
                      ),
                ),
              ),
              Divider(height: 20, color: Colors.grey.withOpacity(0.4)),
              GestureDetector(
                onTap: () async {
                  await pickerService
                      .pickImage(
                    source: ImageSource.gallery,
                  )
                      .then(
                    (value) {
                      imageCropper.cropImage(sourcePath: value!.path).then(
                        (croppedImage) async {
                          Modular.to.pop();

                          await store.updateUserPhoto(croppedImage).then(
                            (value) async {
                              await store.getUserData().catchError(
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
                      );
                    },
                  );
                },
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.photo_library_outlined),
                      const SizedBox(width: 15),
                      Text(
                        'Galeria',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.6),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 20, color: Colors.grey.withOpacity(0.4)),
              GestureDetector(
                onTap: () async {
                  await pickerService
                      .pickImage(
                    source: ImageSource.camera,
                  )
                      .then(
                    (value) {
                      imageCropper.cropImage(sourcePath: value!.path).then(
                        (croppedImage) async {
                          Modular.to.pop();

                          await store.updateUserPhoto(croppedImage).then(
                            (value) async {
                              await store.getUserData().catchError(
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
                      );
                    },
                  );
                },
                child: ColoredBox(
                  color: Colors.transparent,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt_outlined),
                      const SizedBox(width: 15),
                      Text(
                        'Câmera',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black.withOpacity(0.6),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
