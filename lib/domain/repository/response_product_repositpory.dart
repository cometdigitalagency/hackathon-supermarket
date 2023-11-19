import 'package:dartz/dartz.dart';
import 'package:save_mart/core/error/failures.dart';
import 'package:save_mart/domain/entities/response_product_entity.dart';

abstract class ResponseProductRepository {
  Future<Either<Failure, ResponseProductEntity>> fetchProduct();
}
