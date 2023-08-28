import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.grey.withOpacity(0.3),
              child: SvgPicture.asset(
                'assets/images/person.svg',
                height: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
