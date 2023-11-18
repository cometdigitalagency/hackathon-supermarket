import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:save_mart/core/error/failures.dart';
import 'package:save_mart/core/usecase/change_pin_usecase.dart';
import 'package:save_mart/features/home/domain/entities/response_product_entity.dart';
import 'package:save_mart/features/home/domain/repository/response_product_repositpory.dart';

@lazySingleton
class ResponseProductUseCase
    implements UseCase<Either<Failure, ResponseProductEntity>, Noparams> {
  final ResponseProductRepository _productRepository;

  ResponseProductUseCase(this._productRepository);

  @override
  Future<Either<Failure, ResponseProductEntity>> call(Noparams params) async {
    return await _productRepository.fetchProduct();
  }
}
