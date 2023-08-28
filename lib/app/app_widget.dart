import 'package:cabconsumidor/app/core/services/preferences_service.dart';
import 'package:cabconsumidor/app/core/theme/app_theme.dart';
import 'package:cabconsumidor/app/modules/home/stores/obscure_balance_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MyAppLifecycleObserver(
      child: MaterialApp.router(
        title: 'CAB App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
      ),
    );
  }
}

class MyAppLifecycleObserver extends StatefulWidget {
  final Widget child;

  const MyAppLifecycleObserver({super.key, required this.child});

  @override
  _MyAppLifecycleObserverState createState() => _MyAppLifecycleObserverState();
}

class _MyAppLifecycleObserverState extends State<MyAppLifecycleObserver>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused) {
      // O aplicativo foi minimizado
      print('Aplicativo minimizado');
    } else if (state == AppLifecycleState.resumed) {
      final PreferencesService prefsService = PreferencesService();
      final ObscureBalanceStore obscureBalanceStore = Modular.get();

      await prefsService.getObscureBalancePreference().then((value) {
        obscureBalanceStore.updateState(value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
