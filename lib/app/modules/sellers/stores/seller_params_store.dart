import 'package:cabconsumidor/app/core/models/seller_query_params_model.dart';
import 'package:flutter_triple/flutter_triple.dart';

class SellerParamsStore extends Store<SellerQueryParamsModel> {
  SellerParamsStore() : super(SellerQueryParamsModel());

  bool showClearSearchButton = false;

  void updateState(SellerQueryParamsModel model) {
    
    update(model, force: true);
  }
}
