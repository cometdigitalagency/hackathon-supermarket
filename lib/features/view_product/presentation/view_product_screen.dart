import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:save_mart/config/di/config_dependencies.dart';
import 'package:save_mart/config/routes/routes.dart';
import 'package:save_mart/config/routes/routes.gr.dart';
import 'package:save_mart/core/constants/theme/color.dart';
import 'package:save_mart/features/home/domain/entities/response_product_entity.dart';
import 'package:save_mart/features/home/presentation/widget/custom_product_box.dart';
import 'package:save_mart/features/view_product/presentation/widget/custom_view_money_card.dart';

@RoutePage()
class ViewProductScreen extends StatelessWidget {
  final ResponseProductEntity? productEntity;
  final String amountMoney;
  const ViewProductScreen(
      {super.key, required this.amountMoney, this.productEntity});

  @override
  Widget build(BuildContext context) {
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
              CustomViewMoneyCard(moneyAmount: "$amountMoney .00 KIP"),
              const Text(
                "ລາຍການສິນຄ້າ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Divider(color: Colors.grey),
              const SizedBox(height: 18),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 10,
                ),
                itemCount: productEntity?.products.length,
                itemBuilder: (context, index) {
                  return CustomProductBox(
                    price:
                        productEntity?.products[index].price.toString() ?? "",
                    name: productEntity?.products[index].title ?? "",
                    image: NetworkImage(
                        productEntity?.products[index].images[0] ?? ""),
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
