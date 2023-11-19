import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:example/core/error/exceptions.dart';
import 'package:example/core/error/failures.dart';
import 'package:example/core/util/response_helper.dart';
import 'package:example/features/home/data/datasource/response_product_remote_data_source.dart';
import 'package:example/features/home/domain/entities/response_product_entity.dart';
import 'package:example/features/home/domain/repository/response_product_repositpory.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ResponseProductRepository)
class ResponseProductRepositoryImpl implements ResponseProductRepository {
  final ResponseProductRemoteDataSource _remoteDataSource;

  ResponseProductRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, ResponseProductEntity>> fetchProduct() async {
    try {
      final response = await _remoteDataSource.fetchProduct();
      print(response);
      return (Right(response));
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
