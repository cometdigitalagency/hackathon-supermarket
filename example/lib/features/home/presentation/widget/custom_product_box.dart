import 'package:example/core/constants/theme/color.dart';
import 'package:example/features/product_cart/presentation/cubit/product_cart_cubit.dart';
import 'package:example/features/view_product/presentation/cubit/view_product_cubit.dart';
import 'package:example/features/widget/show_confirm_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../config/di/config_dependencies.dart';

class CustomProductBox extends StatelessWidget {
  final String id;
  final double price;
  final String name;
  final String image;
  const CustomProductBox(
      {super.key,
      required this.price,
      required this.name,
      required this.image,
      required this.id});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => showConfirmDialog(
          context: context,
          title: "Confirm",
          content: "Do you want to add $name to cart",
          onPress: () {
            getIt<ViewProductCubit>().onAddTOCart(price);
            getIt<ProductCartCubit>()
                .addToCart(id: id, name: name, price: price, image: image);
          }),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: size.width,
                height: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                  color: ColorConstants.mainColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      price.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
