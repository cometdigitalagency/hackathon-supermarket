// ignore_for_file: must_be_immutable, overridden_fields

import 'package:json_annotation/json_annotation.dart';
import 'package:save_mart/domain/entities/product_entity.dart';
import 'package:save_mart/domain/entities/response_product_entity.dart';
import 'dart:convert';

part 'response_product_model.g.dart';

ResponseProductModel responseProductModelFromJson(String str) =>
    ResponseProductModel.fromJson(json.decode(str));

String responseProductModelToJson(ResponseProductModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ResponseProductModel extends ResponseProductEntity {
  @override
  @JsonKey(name: "products")
  List<Product> products;
  @override
  @JsonKey(name: "total")
  int total;
  @override
  @JsonKey(name: "skip")
  int skip;
  @override
  @JsonKey(name: "limit")
  int limit;

  ResponseProductModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  }) : super(products, total, skip, limit);

  factory ResponseProductModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseProductModelToJson(this);
}

@JsonSerializable()
class Product extends ProductEntity {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "price")
  int price;
  @JsonKey(name: "discountPercentage")
  double discountPercentage;
  @JsonKey(name: "rating")
  double rating;
  @JsonKey(name: "stock")
  int stock;
  @JsonKey(name: "brand")
  String brand;
  @JsonKey(name: "category")
  String category;
  @JsonKey(name: "thumbnail")
  String thumbnail;
  @JsonKey(name: "images")
  List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  }) : super(id, title, description, price, discountPercentage, rating, stock,
            brand, category, thumbnail, images);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
