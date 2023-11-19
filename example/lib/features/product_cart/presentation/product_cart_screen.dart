import 'package:auto_route/auto_route.dart';
import 'package:example/core/constants/theme/color.dart';
import 'package:example/features/product_cart/presentation/cubit/product_cart_cubit.dart';
import 'package:example/features/product_cart/presentation/widget/product_cart_empty.dart';
import 'package:example/features/product_cart/presentation/widget/product_cart_failure.dart';
import 'package:example/features/product_cart/presentation/widget/product_cart_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              initial: () => const ProductCartLoading(),
              loading: () => const ProductCartLoading(),
              success: (data) => ProductCartLoaded(cartData: cartData),
              empty: () => const ProductCartEmpty(),
              failure: (message) => ProductCartFailure(message: message));
        },
      ),
    );
  }
}
