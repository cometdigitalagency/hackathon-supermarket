import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:save_mart/core/constants/key/key_constant.dart';
import 'package:save_mart/features/product_cart/data/model/cart_model.dart';

abstract class ProductCartLocalDataSource {
  Future<CartModel> getCart();
  Future<void> saveCart(CartModel cart);
  Future<void> deleteCart();
}

@LazySingleton(as: ProductCartLocalDataSource)
class CartLocalDataSourceImpl implements ProductCartLocalDataSource {
  final FlutterSecureStorage secureStorage;

  CartLocalDataSourceImpl({required this.secureStorage});

  @override
  Future<CartModel> getCart() async {
    final cartData = await secureStorage.read(key: KeyConstant.cart) ??
        jsonEncode(CartModel(cart: [], totalPrice: 0.0));
    return CartModel.fromJson(jsonDecode(cartData));
  }

  @override
  Future<void> saveCart(CartModel cart) async {
    final cartData = jsonEncode(cart);
    await secureStorage.write(key: KeyConstant.cart, value: cartData);
  }

  @override
  Future<void> deleteCart() async {
    await secureStorage.delete(key: KeyConstant.cart);
  }
}
