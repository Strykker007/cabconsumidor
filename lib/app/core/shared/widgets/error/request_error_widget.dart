import 'package:cabconsumidor/app/core/enums/buttons_enum.dart';
import 'package:cabconsumidor/app/core/shared/widgets/assets/build_assets_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/button/default_button_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RequestErrorWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final DioError? error;
  final String message;

  const RequestErrorWidget({
    Key? key,
    this.buttonText = 'Tentar novamente',
    this.onPressed,
    this.message = '',
    this.error,
  }) : super(key: key);

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
              text: buttonText,
            )
        ],
      ),
    );
  }

  Widget _messageErrorWidget(BuildContext context) {
    String errorMessage = message;
    String messageErrors = '';
    switch (error?.response?.statusCode) {
      case 400:
        // messageErrors = error!.response!.statusMessage!;
        final Map<String, dynamic>? errors = error!.response!.data['errors'];
        errors?.forEach((key, value) {
          if (value == null) return;
          messageErrors += '* $key: $value\n';
        });
        errorMessage = 'Nenhum resultado encontrado!';
        break;
      case 401:
        if (error!.response!.statusMessage!.contains('Unauthorized')) {
          errorMessage = 'não tem permissão para acessar este conteúdo.';
        } else {
          errorMessage = 'Sua sessão expirou ou você '
              'não tem permissão para acessar este conteúdo.';
        }
        break;
      case 403:
        final Map<String, dynamic>? errors = error!.response!.data['errors'];
        errors?.forEach((key, value) {
          if (value == null) return;
          if (value == 'Unauthorized user') {
            errorMessage = 'Você não tem permissão '
                'para acessar este conteúdo.';
          } else if (key == '') {
            errorMessage = value;
          } else {
            errorMessage = 'Usuário e/ou senha incorretos!';
          }
        });
        break;
      case 404:
        errorMessage = ' Nenhum registro encontrado!';
        break;
      case 405:
        errorMessage = 'Ocorreu um erro inesperado.\n'
            'Tente novamente mais tarde.';
        break;
      case 500:
        errorMessage = 'Ocorreu um erro interno do servidor.\n'
            'Tente novamente mais tarde.';
        break;
      case 502:
        errorMessage = 'Servidor está temporariamente indisponível.\n'
            'Tente novamente em instantes.';
        break;
      case 503:
        errorMessage = 'Servidor está temporariamente indisponível.\n'
            'Tente novamente em instantes.';
        break;
      default:
        break;
    }

    switch (error?.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage =
            '[TIMEOUT] Servidor não está respondendo.\nVerifique sua '
            'conexão com a internet ou tente novamente em instantes.';
        break;
      case DioExceptionType.sendTimeout:
        break;
      case DioExceptionType.receiveTimeout:
        break;
      case DioExceptionType.badResponse:
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        errorMessage =
            '[DEFAULT] Servidor não está respondendo.\nVerifique sua '
            'conexão com a internet ou tente novamente em instantes.';

        break;
      default:
        break;
    }

    return Text(
      '$errorMessage$messageErrors',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            backgroundColor: Theme.of(context).colorScheme.background,
            fontWeight: FontWeight.w600,
            height: 1.25,
            color: Colors.black,
          ),
    );
  }
}
