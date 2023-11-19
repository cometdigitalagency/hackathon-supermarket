import 'package:auto_route/auto_route.dart';
import 'package:example/config/di/config_dependencies.dart';
import 'package:example/features/home/presentation/cubit/response_product_cubit.dart';
import 'package:example/features/home/presentation/widget/product_list_failure.dart';
import 'package:example/features/home/presentation/widget/product_list_loading.dart';
import 'package:example/features/home/presentation/widget/product_list_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ResponseProductCubit>();
    final products = cubit.products;
    return Scaffold(
      body: BlocBuilder<ResponseProductCubit, ResponseProductState>(
        builder: (context, state) {
          // print("Current State : $state");
          return state.when(
              initial: () => const ProductListLoading(),
              loading: () => const ProductListLoading(),
              success: (responseProductEntity) => ProductListSuccess(
                    productEntity: products,
                  ),
              failure: (message) => ProductListFailure(message: message));
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ResponseProductCubit>()..initialFetchProductMethod(),
      child: this,
    );
  }
}
