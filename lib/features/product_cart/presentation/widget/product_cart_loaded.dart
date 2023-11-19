import 'package:flutter/material.dart';

import '../../data/model/cart_model.dart';
import 'custom_product_cart_list.dart';

class ProductCartLoaded extends StatelessWidget {
  final CartModel cartData;
  const ProductCartLoaded({super.key, required this.cartData});

  @override
  Widget build(BuildContext context) {
    return cartData.cart.isNotEmpty
        ? ListView.builder(
            itemCount: cartData.cart.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Column(
                  children: [
                    CustomProductCartList(
                      quantity: cartData.cart[index].quantity,
                      title: cartData.cart[index].productName,
                      price: cartData.cart[index].price.toString(),
                      onPressed: () {},
                      image: cartData.cart[index].image,
                    ),
                  ],
                ),
              );
            })
        : Container();
    // return const Placeholder();
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    //   child: Column(
    //     children: [
    //       CustomProductCartList(
    //         title: 'Product name',
    //         subtitle: 'Product price',
    //         onPressed: () {},
    //       ),
    //     ],
    //   ),
    // );
  }
}
