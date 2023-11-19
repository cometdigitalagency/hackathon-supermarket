import 'dart:io';

import 'package:dio/dio.dart';
import 'package:example/core/error/exceptions.dart';
import 'package:example/core/error/failures.dart';
import 'package:example/core/service/product_service.dart';
import 'package:example/core/util/response_helper.dart';
import 'package:example/features/home/data/model/response_product_model.dart';
import 'package:injectable/injectable.dart';

abstract class ResponseProductRemoteDataSource {
  Future<ResponseProductModel> fetchProduct();
}

@LazySingleton(as: ResponseProductRemoteDataSource)
class ResponseProductRemoteDataSourceImpl
    implements ResponseProductRemoteDataSource {
  final ProductService _productService;

  ResponseProductRemoteDataSourceImpl(this._productService);

  @override
  Future<ResponseProductModel> fetchProduct() async {
    try {
      return await _productService.fetchProduct();
    } on DioException catch (e) {
      throw ResponseHelper.returnResponse(e);
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } on SocketException catch (e) {
      throw ServerFailure(e.message);
    } on ConnectionException catch (e) {
      throw ConnectionFailure(e.message);
    } catch (error) {
      throw ServerException(error.toString());
    }
  }
}
