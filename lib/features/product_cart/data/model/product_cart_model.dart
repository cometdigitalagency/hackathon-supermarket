import 'package:json_annotation/json_annotation.dart';

part 'product_cart_model.g.dart';

@JsonSerializable()
class ProductCartModel {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "productName")
  String productName;
  @JsonKey(name: "price")
  double price;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "quantity")
  int quantity;

  ProductCartModel({
    required this.id,
    required this.productName,
    required this.price,
    required this.image,
    required this.quantity,
  });

  factory ProductCartModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCartModelToJson(this);
}
