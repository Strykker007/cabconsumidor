import 'package:firebase_core/firebase_core.dart';

class FirebaseExceptions {
  static Exception getErrorException(FirebaseException e) {
    if (e.code == 'user-not-found') {
      return Exception(
        'Usuário não encontrado',
      );
    } else if (e.code == 'wrong-password') {
      return Exception(
        'Senha incorreta',
      );
    } else if (e.code == 'network-request-failed') {
      return Exception(
        'Sem conexão com a internet',
      );
    } else {
      return Exception(
        'Erro desconhecido',
      );
    }
  }
}
