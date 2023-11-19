part of 'response_product_cubit.dart';

@freezed
class ResponseProductState with _$ResponseProductState {
  const factory ResponseProductState.initial() = _Initial;
  const factory ResponseProductState.loading() = _Loading;

  const factory ResponseProductState.success(
      List<Product> responseProductEntity) = _Success;

  const factory ResponseProductState.failure(String message) = _Failure;
}
