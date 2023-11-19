part of 'view_product_cubit.dart';

@freezed
class ViewProductState with _$ViewProductState {
  const factory ViewProductState.initial() = _Initial;
  const factory ViewProductState.loading() = _Loading;
  const factory ViewProductState.success(List<Product> products) = _Success;
  const factory ViewProductState.empty() = _Empty;
  const factory ViewProductState.failure(String message) = _Failure;
}
