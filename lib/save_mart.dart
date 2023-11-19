library save_mart;

import 'package:save_mart/data/model/response_product_model.dart';

export 'save_mart.dart';

class FlitterProductByPrice {
  List<Product> _products = [];
  Future<List<Product>> flitterProductByPrice(double price) async {
    final data = _products.where((element) => element.price < price).toList();
    _products = data;
    return data;
  }
}
