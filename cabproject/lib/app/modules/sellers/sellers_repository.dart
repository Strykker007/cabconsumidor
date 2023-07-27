import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cabproject/app/core/models/seller_model.dart';
import 'package:cabproject/app/core/services/firebase_exceptions.dart';

class SellersRepository {
  final Dio client;
  SellersRepository(
    this.client,
  );

  Future<List<SellerModel>> getSellersList() async {
    try {
      final response = await client.get('/vendedor/');
      List<SellerModel> sellers = List.empty(growable: true);

      response.data.forEach((seller) {
        sellers.add(SellerModel.fromJson(seller));
      });
      return sellers;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SellerModel>> getSellersListByName(String name) async {
    final List<SellerModel> sellers = List.empty(growable: true);

    try {
      // await _firestore.collection('sellers').get().then(
      //   (snapshot) {
      //     for (var element in snapshot.docs) {
      //       SellerModel model = SellerModel.fromMap(element.data());
      //       if (model.name!.toLowerCase().contains(name.toLowerCase())) {
      //         model.code = element.id;
      //         sellers.add(model);
      //       }
      //     }
      //   },
      // );

      return sellers;
    } on FirebaseAuthException catch (e) {
      final Exception error = FirebaseExceptions.getErrorException(e);
      throw error;
    }
  }
}
