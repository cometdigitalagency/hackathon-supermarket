import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_mart/config/di/config_dependencies.dart';

import 'package:save_mart/features/home/presentation/cubit/response_product_cubit.dart';
import 'package:save_mart/features/home/presentation/widget/product_list_failure.dart';
import 'package:save_mart/features/home/presentation/widget/product_list_loading.dart';
import 'package:save_mart/features/home/presentation/widget/product_list_success.dart';

@RoutePage()
class HomeScreen extends StatelessWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ResponseProductCubit, ResponseProductState>(
        builder: (context, state) {
          print("Current State : $state");
          return state.when(
              initial: () => ProductListLoading(),
              loading: () => ProductListLoading(),
              success: (responseProductEntity) => ProductListSuccess(
                    productEntity: responseProductEntity,
                  ),
              failure: (message) => ProductListFailure());
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
