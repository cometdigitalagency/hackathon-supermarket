import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:save_mart/core/constants/theme/color.dart';
import 'package:save_mart/features/product_cart/presentation/widget/custom_product_cart_list.dart';

@RoutePage()
class ProductCartScreen extends StatelessWidget {
  const ProductCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.mainColor,
        foregroundColor: Colors.white,
        title: const Text("ລາຍລະອຽດໃບບິນ"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete, color: Colors.red))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          children: [
            CustomProductCartList(
              title: 'Product name',
              subtitle: 'Product price',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
