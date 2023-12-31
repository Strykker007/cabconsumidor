import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBarWidget extends StatelessWidget {
  final String? title;
  final bool visibleTitle;
  final Color? colorTitle;
  final Color? backgroundColor;
  final Function()? onBackPressed;
  final Function()? actionsPressed;
  final Icon? iconLeading;
  final bool showLeading;
  final List<Widget> actions;
  final bool showAction;
  final double elevation;

  const AppBarWidget({
    Key? key,
    this.title,
    this.visibleTitle = true,
    this.colorTitle,
    this.backgroundColor,
    this.showLeading = true,
    this.showAction = false,
    this.actions = const [],
    this.iconLeading,
    this.onBackPressed,
    this.actionsPressed,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: elevation,
      title: visibleTitle
          ? Text(
              title!,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            )
          : const SizedBox.shrink(),
      backgroundColor:
          backgroundColor ?? Theme.of(context).colorScheme.background,
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
      ),
      leading: Visibility(
        visible: showLeading,
        child: IconButton(
          icon: iconLeading ??
              const Icon(
                Icons.arrow_back_ios,
              ),
          onPressed: onBackPressed ??
              () {
                Modular.to.pop();
              },
        ),
      ),
      actions: actions,
    );
  }
}
