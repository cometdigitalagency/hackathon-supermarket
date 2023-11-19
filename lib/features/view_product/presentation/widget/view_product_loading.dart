import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../home/presentation/widget/custom_product_box.dart';

class ViewProductLoading extends StatelessWidget {
  const ViewProductLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE0E0E0),
      highlightColor: const Color(0xFFF5F5F5),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          crossAxisSpacing: 10,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return CustomProductBox(
            price: 0.0,
            name: "",
            image: "",
            id: '',
          );
        },
      ),
    );
  }
}
