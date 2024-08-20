import 'package:cabconsumidor/app/core/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_triple/flutter_triple.dart';

class ProfilePhotoWidget extends StatefulWidget {
  const ProfilePhotoWidget({super.key});

  @override
  State<ProfilePhotoWidget> createState() => _ConfigProfilePhotoWidgetState();
}

class _ConfigProfilePhotoWidgetState extends State<ProfilePhotoWidget> {
  final UserStore userStore = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    userStore.state.user!.profilePhoto!.contains('http')
                        ? userStore.state.user!.profilePhoto!
                        : dotenv.env['BASE_URL']! +
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
                          value: loadingProgress.expectedTotalBytes != null
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
    );
  }
}
