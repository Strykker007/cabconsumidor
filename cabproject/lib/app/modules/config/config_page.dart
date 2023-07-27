import 'package:cabproject/app/core/enums/buttons_enum.dart';
import 'package:cabproject/app/core/services/helpers.dart';
import 'package:cabproject/app/core/services/logout_service.dart';
import 'package:cabproject/app/core/shared/widgets/app_bar_widget.dart';
import 'package:cabproject/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:cabproject/app/core/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfigPage extends StatefulWidget {
  final String title;
  const ConfigPage({Key? key, this.title = 'Configurações'}) : super(key: key);
  @override
  ConfigPageState createState() => ConfigPageState();
}

class ConfigPageState extends State<ConfigPage> {
  final UserStore userStore = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: widget.title,
        backgroundColor: Colors.transparent,
      ).build(context) as AppBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: <Widget>[
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
                store: userStore,
                builder: (_, triple) {
                  if (triple.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  }
                  return userStore.state.user!.profilePhoto == null
                      ? SvgPicture.asset(
                          'assets/profile/profile_image.svg',
                          height: 50,
                          width: 50,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            userStore.state.user!.profilePhoto!,
                            height: 50,
                            width: 50,
                            fit: BoxFit.fill,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Theme.of(context).primaryColor,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              userStore.state.user!.name!,
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
                        Modular.to.navigate('/home/config/profile');
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
                        Modular.to.navigate('/home/config/address');
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
                        Modular.to.navigate('/home/config/bankData');
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
                        Modular.to.navigate('/home/config/changePassword');
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
                      onTap: () {},
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
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                      buttonType: DefaultButtonType.outline,
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
    );
  }
}
