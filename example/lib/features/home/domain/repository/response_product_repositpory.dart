import 'package:dartz/dartz.dart';
import 'package:example/core/error/failures.dart';
import 'package:example/features/home/domain/entities/response_product_entity.dart';

abstract class ResponseProductRepository {
  Future<Either<Failure, ResponseProductEntity>> fetchProduct();
}
