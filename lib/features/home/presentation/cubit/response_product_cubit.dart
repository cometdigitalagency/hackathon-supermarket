import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:save_mart/core/usecase/change_pin_usecase.dart';
import 'package:save_mart/features/home/domain/entities/response_product_entity.dart';
import 'package:save_mart/features/home/domain/usecase/response_product_usecase.dart';

part 'response_product_state.dart';
part 'response_product_cubit.freezed.dart';

@injectable
class ResponseProductCubit extends Cubit<ResponseProductState> {
  final ResponseProductUseCase _productUseCase;
  ResponseProductCubit(this._productUseCase)
      : super(const ResponseProductState.initial());

  Future<void> initialFetchProductMethod() async {
    await fetchProduct();
  }

  Future<void> fetchProduct() async {
    emit(const ResponseProductState.loading());
    final data = await _productUseCase(Noparams());
    data.fold((l) => emit(ResponseProductState.failure(l.message)), (r) {
      emit(ResponseProductState.success(r));
    });
  }
}
