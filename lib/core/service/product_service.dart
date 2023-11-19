import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:save_mart/core/constants/api/api_constant.dart';
import 'package:save_mart/data/model/response_product_model.dart';

part 'product_service.g.dart';

@lazySingleton
@RestApi(baseUrl: baseUrl)
abstract class ProductService {
  @factoryMethod
  factory ProductService(Dio dio) = _ProductService;

  @GET(productUrl)
  Future<ResponseProductModel> fetchProduct();
}
