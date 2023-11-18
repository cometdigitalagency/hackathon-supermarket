import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:save_mart/core/error/exceptions.dart';
import 'package:save_mart/core/error/failures.dart';
import 'package:save_mart/core/service/product_service.dart';
import 'package:save_mart/core/util/response_helper.dart';
import 'package:save_mart/features/home/data/model/response_product_model.dart';

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
