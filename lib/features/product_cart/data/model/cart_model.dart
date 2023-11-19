import 'package:json_annotation/json_annotation.dart';

import 'package:save_mart/features/product_cart/data/model/product_cart_model.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  @JsonKey(name: "cart")
  List<ProductCartModel> cart;
  @JsonKey(name: "totalPrice")
  double totalPrice;

  CartModel({
    required this.cart,
    required this.totalPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
