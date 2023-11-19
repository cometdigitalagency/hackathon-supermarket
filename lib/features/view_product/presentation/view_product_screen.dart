import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_mart/config/di/config_dependencies.dart';
import 'package:save_mart/config/routes/routes.dart';
import 'package:save_mart/config/routes/routes.gr.dart';
import 'package:save_mart/core/constants/theme/color.dart';

import 'package:save_mart/features/view_product/presentation/widget/custom_view_money_card.dart';
import 'package:save_mart/features/view_product/presentation/widget/view_product_failure.dart';
import 'package:save_mart/features/view_product/presentation/widget/view_product_success.dart';

import 'cubit/view_product_cubit.dart';
import 'widget/view_product_loading.dart';

@RoutePage()
class ViewProductScreen extends StatelessWidget implements AutoRouteWrapper {
  final double amountMoney;
  const ViewProductScreen({super.key, required this.amountMoney});
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ViewProductCubit>()..initialFetchProductMethod(amountMoney),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ViewProductCubit>();
    final remainingPrice = cubit.price;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.mainColor,
        foregroundColor: Colors.white,
        title: const Text("ເບິ່ງສິນຄ້າຕາມວົງເງີນ"),
        actions: [
          IconButton(
              onPressed: () {
                getIt<AppRouter>().push(const ProductCartRoute());
              },
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomViewMoneyCard(moneyAmount: remainingPrice),
              const Text(
                "ລາຍການສິນຄ້າ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 18),
              BlocBuilder<ViewProductCubit, ViewProductState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const ViewProductLoading(),
                    loading: () => const ViewProductLoading(),
                    success: (products) =>
                        ViewProductSuccess(products: products),
                    empty: () => const ViewProductLoading(),
                    failure: (message) => ViewProductFailure(
                      message: message,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
