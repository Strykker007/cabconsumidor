import 'package:cabconsumidor/app/core/models/user_model.dart';
import 'package:dio/dio.dart';

import 'package:cabconsumidor/app/core/models/credential_model.dart';
import 'package:cabconsumidor/app/core/models/jwtmodel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthRepository {
  final Dio client = Dio(
    BaseOptions(
      baseUrl: dotenv.env['BASE_URL']! + dotenv.env['API_VERSION']!,
      connectTimeout: Duration(
        milliseconds: int.parse(dotenv.env['TIMEOUT']!),
      ),
    ),
  );
  Future<JwtModel?> authenticate(CredentialModel credential) async {
    try {
      final response = await client.post(
        '/login/',
        data: credential.toJson(),
      );
      return JwtModel.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> passwordRecovery(String email) async {
    try {
      await client.post(
        '/recuperar-senha/',
        data: {'email': email},
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel?> getUserById(String token, String userId) async {
    try {
      final response = await client.get(
        '/user/$userId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return UserModel.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }
  // Future<UserModel?> authenticate(CredentialModel credential) async {
  //   try {
  //     final UserCredential user =
  //         await _firebaseAuth.signInWithEmailAndPassword(
  //       email: credential.username!,
  //       password: credential.password!,
  //     );
  //     final DocumentSnapshot<Map<String, dynamic>> doc =
  //         await _firebaseFirestore
  //             .collection('users')
  //             .doc(user.user!.uid)
  //             .get();
  //     return UserModel.fromMap(doc.data()!);
  //   } on FirebaseAuthException catch (e) {
  //     final Exception error = FirebaseExceptions.getErrorException(e);
  //     throw error;
  //   }
  // }
}
