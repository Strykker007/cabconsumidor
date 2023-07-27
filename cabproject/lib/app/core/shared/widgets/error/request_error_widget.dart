import 'dart:developer';

import 'package:cabproject/app/core/enums/buttons_enum.dart';
import 'package:cabproject/app/core/shared/widgets/assets/build_assets_widget.dart';
import 'package:cabproject/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RequestErrorWidget extends StatelessWidget {
  final DioException? error;
  final VoidCallback? onPressed;
  final String? message;
  final String? buttonText;

  const RequestErrorWidget({
    Key? key,
    this.error,
    this.onPressed,
    this.message,
    this.buttonText,
  }) : super(key: key);

  String getErrorMessage() {
    switch (error!.type) {
      case DioExceptionType.cancel:
        return 'Requisição cancelada.';
      case DioExceptionType.connectionTimeout:
        return 'Tempo limite de conexão excedido.';
      case DioExceptionType.sendTimeout:
        return 'Tempo limite de envio excedido.';
      case DioExceptionType.receiveTimeout:
        return 'Tempo limite de recebimento excedido.';
      case DioExceptionType.badResponse:
        switch (error!.response!.statusCode) {
          case 400:
            return getMessageResponse(error!.response!.data);
          case 401:
            return 'Sua sessão expirou ou você não '
                'tem permissão para acessar este recurso.';
          case 403:
            return 'Você não tem permissão para acessar este recurso.';
          case 404:
            return getMessageResponse(error!.response!.data);
          case 409:
            return 'Conflito.';
          case 500:
            return 'Erro interno do servidor.';
          case 503:
            return 'Serviço indisponível.';
          default:
            return 'Ocorreu um erro inesperado.';
        }
      case DioExceptionType.unknown:
        return 'Erro de comunicação com o servidor.';
      default:
        return 'Ocorreu um erro inesperado.';
    }
  }

  String getMessageResponse(dynamic data) {
    String message = 'Ocorreu um erro inesperado.\n';
    final Map<String, dynamic>? errors = data['errors'];
    errors?.forEach((key, value) {
      if (value == null) return;
      message = '* $key: $value\n';
    });
    message = message.split('[')[1].split(']')[0].trim();
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          Text(
            'Parece que algo deu errado.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: BuildAssetsWidget(
              message: _messageErrorWidget(context),
              assetBase: 'assets/error/erro_one.svg',
              asset: 'assets/error/erro_two.svg',
              boxFit: BoxFit.contain,
              width: 10.5,
            ),
          ),
          if (onPressed != null) const SizedBox(height: 15),
          if (onPressed != null)
            DefaultButtonWidget(
              onPressed: onPressed,
              buttonType: DefaultButtonType.outline,
              text: buttonText!,
            )
        ],
      ),
    );
  }

  Widget _messageErrorWidget(BuildContext context) {
    log('error: ${message ?? getErrorMessage()}');
    return Text(
      message ?? getErrorMessage(),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            backgroundColor: Theme.of(context).colorScheme.background,
            height: 1.25,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
