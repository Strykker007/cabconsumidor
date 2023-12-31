import 'dart:developer';

import 'package:cabconsumidor/app/core/services/preferences_service.dart';
import 'package:cabconsumidor/app/core/shared/widgets/error/request_error_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final PreferencesService service = PreferencesService();

    await service.getUserId().then((userId) async {
      if (userId == null) return;
      await service.getUserPreferences(userId).then((preferences) async {
        // dio.lock();
        options.headers.addAll(
          {'Authorization': 'Bearer ${preferences!.jwt!.token}'},
        );
      });
    });
    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    handler.next(response);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await Modular.to.push(
        PageRouteBuilder(
          opaque: false,
          fullscreenDialog: true,
          barrierColor: Colors.black.withOpacity(0.5),
          transitionDuration: const Duration(milliseconds: 250),
          pageBuilder: (context, animation, secondaryAnimation) {
            animation = Tween(begin: 0.0, end: 1.0).animate(
              animation,
            );
            return FadeTransition(
              opacity: animation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.1,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Theme.of(context).cardColor,
                        width: 0.1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: -5,
                          color: Theme.of(context).cardColor,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: RequestErrorWidget(
                        message: 'Sua sessão expirou!\n'
                            'Realize o login novamente para '
                            'continuar utilizando nossos serviços.',
                        buttonText: 'Ir para o login',
                        onPressed: () => Modular.to.pop(),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      );

      Modular.to.pop();

      Modular.to.popUntil(ModalRoute.withName('/'));
      Modular.to.pushNamed('/auth');
      log('Sessão do beneficiário expirou!');
    }
    handler.next(err);
  }
}
