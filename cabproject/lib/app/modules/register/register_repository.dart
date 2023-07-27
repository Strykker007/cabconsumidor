import 'package:cabproject/app/core/models/register_model.dart';
import 'package:cabproject/app/core/services/firebase_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> registerUser(RegisterModel user) async {
    UserCredential? credential;
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!)
          .then(
        (userCredential) async {
          _firestore.collection('users').doc(userCredential.user!.uid).set(
            {
              'cpf': user.cpf,
              'email': user.email,
              'phone': user.phone,
            },
          );
          credential = userCredential;
        },
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      final Exception error = FirebaseExceptions.getErrorException(e);
      throw error;
    }
  }
}
