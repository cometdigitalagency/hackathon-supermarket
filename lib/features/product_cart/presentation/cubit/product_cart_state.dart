part of 'product_cart_cubit.dart';

@freezed
class ProductCartState with _$ProductCartState {
  const factory ProductCartState.initial() = _Initial;
  const factory ProductCartState.loading() = _Loading;
  const factory ProductCartState.success(CartModel cart) = _Success;
  const factory ProductCartState.empty() = _Empty;
  const factory ProductCartState.failure(String message) = _Failure;
}
