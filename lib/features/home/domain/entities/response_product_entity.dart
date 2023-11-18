import 'package:equatable/equatable.dart';
import 'package:save_mart/features/home/data/model/response_product_model.dart';

class ResponseProductEntity extends Equatable {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  const ResponseProductEntity(this.products, this.total, this.skip, this.limit);

  @override
  List<Object?> get props => [products, total, skip, limit];
}
