import 'package:flutter_modular/flutter_modular.dart';
import 'package:cabconsumidor/app//modules/splash/splash_store.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final SplashStore store = Modular.get();

  @override
  void initState() {
    store.getUserSession().then((value) {
      Modular.to.pushNamed('/home');
    }).catchError((onError) {
      Modular.to.pushNamed('/auth');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/background/bg.png',
              ),
            ),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 240,
              ),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/cab.png',
                  scale: 10,
                ),
              ),
              const Spacer(),
              Text(
                'Verificando sessão do usuário...',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
