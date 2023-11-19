import 'package:dio/dio.dart';
import 'package:example/core/constants/api/api_constant.dart';
import 'package:example/features/home/data/model/response_product_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'product_service.g.dart';

@lazySingleton
@RestApi(baseUrl: baseUrl)
abstract class ProductService {
  @factoryMethod
  factory ProductService(Dio dio) = _ProductService;

  @GET(productUrl)
  Future<ResponseProductModel> fetchProduct();
}
