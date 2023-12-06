import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final UserStore store = Modular.get();
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leadingWidth: 100,
      leading: Image.asset(
        'assets/images/cab.png',
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: GestureDetector(
            onTap: () {
              Modular.to.pushNamed(
                '/home/config/profile',
                arguments: 'Informações pessoais',
              );
            },
            child: store.state.user!.profilePhoto == null
                ? SvgPicture.asset(
                    'assets/profile/profile_image.svg',
                    height: 30,
                    width: 30,
                  )
                : CircleAvatar(
                    radius: 15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        store.state.user!.profilePhoto!.contains('http')
                            ? store.state.user!.profilePhoto!
                            : dotenv.env['BASE_URL']! +
                                store.state.user!.profilePhoto!,
                        height: 30,
                        width: 30,
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Container(
                            height: 30,
                            color: Colors.white,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 5,
                                  color: Theme.of(context).primaryColor,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
