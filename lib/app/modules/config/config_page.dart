import 'package:cabconsumidor/app/core/enums/buttons_enum.dart';
import 'package:cabconsumidor/app/core/services/helpers.dart';
import 'package:cabconsumidor/app/core/services/logout_service.dart';
import 'package:cabconsumidor/app/core/shared/widgets/appbar/app_bar_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/error/request_error_widget.dart';
import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:cabconsumidor/app/modules/config/widgets/config_profile_photo_widget.dart';
import 'package:cabconsumidor/app/modules/config/stores/config_store.dart';
import 'package:cabconsumidor/app/modules/config/stores/version_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/delete_account_modal_widget.dart';

class ConfigPage extends StatefulWidget {
  final String title;
  const ConfigPage({Key? key, this.title = 'Configurações'}) : super(key: key);
  @override
  ConfigPageState createState() => ConfigPageState();
}

class ConfigPageState extends State<ConfigPage> {
  // final UserStore userStore = Modular.get();
  final ConfigStore store = Modular.get();
  final VersionStore versionStore = Modular.get();

  @override
  void initState() {
    versionStore.setVersionApp();
    super.initState();
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
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: <Widget>[
                    const ConfigProfilePhotoWidget(),
                    const SizedBox(height: 20),
                    Text(
                      store.userStore.state.user!.name!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                    ),
                    const SizedBox(height: 30),
                    Divider(color: Colors.grey.shade600),
                    Flexible(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                Modular.to.pushNamed(
                                  '/home/config/profile',
                                  arguments: 'Informações pessoais',
                                );
                              },
                              leading: const Icon(Icons.person),
                              title: Text(
                                'Dados Pessoais',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                            Divider(color: Colors.grey.shade600),
                            ListTile(
                              onTap: () {
                                Modular.to.pushNamed(
                                  '/home/config/address',
                                  arguments: 'Endereço',
                                );
                              },
                              leading: const Icon(Icons.person),
                              title: Text(
                                'Endereço',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                            Divider(color: Colors.grey.shade600),
                            ListTile(
                              onTap: () {
                                Modular.to.pushNamed(
                                  '/home/config/bankData',
                                  arguments: 'Dados bancários',
                                );
                              },
                              leading: const Icon(Icons.person),
                              title: Text(
                                'Dados Bancários',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                            Divider(color: Colors.grey.shade600),
                            ListTile(
                              onTap: () {
                                Modular.to.pushNamed(
                                  '/home/config/changePassword',
                                  arguments: 'Alterar senha',
                                );
                              },
                              leading: const Icon(Icons.person),
                              title: Text(
                                'Alterar senha',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                            Divider(color: Colors.grey.shade600),
                            ListTile(
                              onTap: () async {
                                final Uri url = Uri.parse('https://google.com');
                                if (!await launchUrl(url)) {
                                  throw Exception('Could not launch $url');
                                }
                              },
                              leading: const Icon(Icons.person),
                              title: Text(
                                'Termos e condicões de uso',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                            Divider(color: Colors.grey.shade600),
                            ListTile(
                              onTap: () {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) =>
                                      const DeleteAccountModalWidget(),
                                );
                              },
                              leading: const Icon(Icons.person),
                              title: Text(
                                'Excluir conta',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                            Divider(color: Colors.grey.shade600),
                            ListTile(
                              onTap: () {
                                Helpers.showDefaultDialog(
                                  context,
                                  Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text('Deseja realmente sair?'),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            DefaultButtonWidget(
                                              text: 'Cancelar',
                                              isDisabled: false,
                                              onPressed: () {
                                                Modular.to.pop();
                                              },
                                              isLoading: false,
                                            ),
                                            const SizedBox(width: 20),
                                            DefaultButtonWidget(
                                              buttonType:
                                                  DefaultButtonType.outline,
                                              text: 'Sair',
                                              isDisabled: false,
                                              onPressed: () {
                                                LogoutService.logout();
                                              },
                                              isLoading: false,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  showClose: true,
                                );
                              },
                              leading: const Icon(Icons.person),
                              title: Text(
                                'Sair',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: TripleBuilder(
                store: versionStore,
                builder: (context, triple) {
                  return Text(
                    'Versão: ${versionStore.state}',
                    textAlign: TextAlign.center,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
