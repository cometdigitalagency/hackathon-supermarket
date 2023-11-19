import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:save_mart/core/usecase/change_pin_usecase.dart';

import '../../../home/data/model/response_product_model.dart';
import '../../../home/domain/usecase/response_product_usecase.dart';

part 'view_product_state.dart';
part 'view_product_cubit.freezed.dart';

@injectable
class ViewProductCubit extends Cubit<ViewProductState> {
  final ResponseProductUseCase _productUseCase;
  ViewProductCubit(this._productUseCase)
      : super(const ViewProductState.initial());

  List<Product> _products = [];
  double _price = 0.0;

  Future<void> initialFetchProductMethod(double price) async {
    _price = price;
    await fetchProduct();
  }

  Future<void> fetchProduct() async {
    try {
      emit(const ViewProductState.loading());
      final data = await _productUseCase(Noparams());
      data.fold((l) => emit(ViewProductState.failure(l.message)), (r) {
        final data =
            r.products.where((element) => element.price <= _price).toList();
        _products = data;
        if (data.isEmpty) {
          emit(const ViewProductState.empty());
        } else {
          emit(ViewProductState.success(data));
        }
      });
    } catch (e) {
      emit(const ViewProductState.failure("something went wrong"));
    }
  }

  Future<void> onAddTOCart(double productPrice) async {
    try {
      emit(const ViewProductState.loading());
      double remainingPrice = (_price - productPrice);
      _price = remainingPrice;
      print(remainingPrice);
      final data = await _productUseCase(Noparams());
      data.fold((l) => emit(ViewProductState.failure(l.message)), (r) {
        final data = r.products
            .where((element) => element.price <= remainingPrice)
            .toList();
        _products = data;
        if (data.isEmpty) {
          emit(const ViewProductState.empty());
        } else {
          emit(ViewProductState.success(data));
        }
      });
    } catch (e) {
      emit(const ViewProductState.failure("something went wrong"));
    }
  }

  List<Product> get products => _products;
  double get price => _price;
}
