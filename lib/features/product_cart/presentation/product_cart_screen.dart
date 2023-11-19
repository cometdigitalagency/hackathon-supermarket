import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_mart/core/constants/theme/color.dart';
import 'package:save_mart/features/product_cart/presentation/cubit/product_cart_cubit.dart';
import 'package:save_mart/features/product_cart/presentation/widget/custom_product_cart_list.dart';

import '../../../config/di/config_dependencies.dart';
import 'widget/product_cart_loaded.dart';

@RoutePage()
class ProductCartScreen extends StatelessWidget implements AutoRouteWrapper {
  const ProductCartScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductCartCubit>()..initial(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ProductCartCubit>();
    final cartData = cubit.cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.mainColor,
        foregroundColor: Colors.white,
        title: const Text("ລາຍລະອຽດໃບບິນ"),
        actions: [
          IconButton(
              onPressed: () =>
                  BlocProvider.of<ProductCartCubit>(context).removeCart(),
              icon: const Icon(Icons.delete, color: Colors.red))
        ],
      ),
      body: BlocBuilder<ProductCartCubit, ProductCartState>(
        builder: (context, state) {
          return state.when(
            initial: () => ProductCartLoaded(cartData: cartData),
            loading: () => ProductCartLoaded(cartData: cartData),
            success: (data) => ProductCartLoaded(cartData: cartData),
            empty: () => ProductCartLoaded(cartData: cartData),
            failure: (message) => ProductCartLoaded(cartData: cartData),
          );
        },
      ),
    );
  }
}
