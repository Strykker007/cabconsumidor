import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuListWidgets extends StatelessWidget {
  const MenuListWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> list = [
      GestureDetector(
        onTap: () {
          Modular.to.pushNamed('/home/sellers');
        },
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.group,
                  size: 40,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Vendedores',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                      ),
                )
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Modular.to.pushNamed('/home/payment');
        },
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            height: 50,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.payment,
                  size: 40,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Pagar',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    ];
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: list[index],
          );
        },
      ),
    );
  }
}
