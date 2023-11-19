import 'package:flutter/material.dart';

import '../../../home/data/model/response_product_model.dart';
import '../../../home/presentation/widget/custom_product_box.dart';

class ViewProductSuccess extends StatelessWidget {
  final List<Product> products;
  const ViewProductSuccess({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 30,
        crossAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return CustomProductBox(
          id: products[index].id.toString(),
          price: double.tryParse(products[index].price.toString()) ?? 0.0,
          name: products[index].title,
          image: products[index].thumbnail,
        );
      },
    );
  }
}
