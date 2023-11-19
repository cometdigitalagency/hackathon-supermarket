import 'package:example/features/product_cart/data/model/cart_model.dart';
import 'package:example/features/product_cart/data/model/product_cart_model.dart';
import 'package:example/features/product_cart/data/product_cart_local_data_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'product_cart_state.dart';
part 'product_cart_cubit.freezed.dart';

@injectable
class ProductCartCubit extends Cubit<ProductCartState> {
  final ProductCartLocalDataSource _productCartLocalDataSource;
  ProductCartCubit(this._productCartLocalDataSource)
      : super(const ProductCartState.initial());

  CartModel _cart = CartModel(cart: [], totalPrice: 0.0);

  Future<void> initial() async {
    try {
      emit(const ProductCartState.loading());
      final data = await _productCartLocalDataSource.getCart();
      if (data.cart.isNotEmpty) {
        _cart = data;
        emit(ProductCartState.success(data));
      } else {
        emit(const ProductCartState.empty());
      }
    } catch (e) {
      emit(const ProductCartState.failure("Something went wrong"));
    }
  }

  Future<void> addToCart(
      {required String id,
      required String name,
      required double price,
      required String image}) async {
    try {
      emit(const ProductCartState.loading());

      double total = 0;
      List<ProductCartModel> cartProductData = [];

      final oldCart = await _productCartLocalDataSource.getCart();
      final isHasSameProduct =
          oldCart.cart.where((element) => element.id == id);
      if (isHasSameProduct.isNotEmpty) {
        if (oldCart.cart.isNotEmpty) {
          for (int i = 0; i < oldCart.cart.length; i++) {
            if (oldCart.cart[i].id == id) {
              final updateCart = ProductCartModel(
                id: oldCart.cart[i].id,
                productName: oldCart.cart[i].productName,
                price: oldCart.cart[i].price,
                image: oldCart.cart[i].image,
                quantity: oldCart.cart[i].quantity + 1,
              );
              cartProductData.add(updateCart);
            } else {
              cartProductData.add(ProductCartModel(
                id: oldCart.cart[i].id,
                productName: oldCart.cart[i].productName,
                price: oldCart.cart[i].price,
                image: oldCart.cart[i].image,
                quantity: oldCart.cart[i].quantity,
              ));
            }
          }
        } else {
          cartProductData.add(ProductCartModel(
            id: id,
            productName: name,
            price: price,
            image: image,
            quantity: 1,
          ));
        }
      } else {
        for (int i = 0; i < oldCart.cart.length; i++) {
          final updateCart = ProductCartModel(
            id: oldCart.cart[i].id,
            productName: oldCart.cart[i].productName,
            price: oldCart.cart[i].price,
            image: oldCart.cart[i].image,
            quantity: oldCart.cart[i].quantity,
          );
          cartProductData.add(updateCart);
        }
        cartProductData.add(ProductCartModel(
          id: id,
          productName: name,
          price: price,
          image: image,
          quantity: 1,
        ));
      }

      for (int i = 0; i < cartProductData.length; i++) {
        total = total + cartProductData[i].price;
      }

      final cartData = CartModel(cart: cartProductData, totalPrice: total);
      _cart = cartData;
      await _productCartLocalDataSource.saveCart(cartData);

      emit(ProductCartState.success(cartData));
    } catch (e) {
      emit(const ProductCartState.failure("Something went wrong"));
    }
  }

  Future<void> removeItemById(String id) async {
    try {
      emit(const ProductCartState.loading());
    } catch (e) {
      emit(const ProductCartState.failure("Something went wrong"));
    }
  }

  Future<void> removeCart() async {
    try {
      emit(const ProductCartState.loading());
      await _productCartLocalDataSource.deleteCart();
      _cart = CartModel(cart: [], totalPrice: 0.0);
      emit(ProductCartState.success(_cart));
    } catch (e) {
      emit(const ProductCartState.failure("Something went wrong"));
    }
  }

  CartModel get cart => _cart;
}
