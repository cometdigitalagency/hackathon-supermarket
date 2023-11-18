import 'package:flutter/material.dart';
import 'package:save_mart/core/constants/theme/color.dart';
import 'package:save_mart/features/home/domain/entities/response_product_entity.dart';
import 'package:save_mart/features/home/presentation/widget/custom_banner_slide.dart';
import 'package:save_mart/features/home/presentation/widget/custom_choice_box.dart';
import 'package:save_mart/features/home/presentation/widget/custom_product_box.dart';
import 'package:save_mart/features/home/presentation/widget/custom_see_more_button.dart';
import 'package:save_mart/features/set_money_limit/set_money_limit_dialog.dart';
import 'package:save_mart/features/widget/custom_search_box.dart';

class ProductListSuccess extends StatelessWidget {
  final ResponseProductEntity productEntity;
  const ProductListSuccess({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.mainColor,
        foregroundColor: Colors.white,
        title: const Text("ໜ້າຫຼັກ"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            child: Column(
              children: [
                const CustomSearchBox(),
                const SizedBox(height: 15),
                const CustomBannerSlide(),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                        child: CustomChoiceBox(
                      onPressed: () {},
                      title: 'ກວດສອບການໃຊ້ເງີນ',
                      icon: Icons.wallet,
                    )),
                    const SizedBox(width: 10),
                    Expanded(
                        child: CustomChoiceBox(
                      onPressed: () => setMoneyLimitDialog(context),
                      title: 'ເບິ່ງສິນຄ້າຕາມວົງເງີນ',
                      icon: Icons.shopify_rounded,
                    )),
                  ],
                ),
                const SizedBox(height: 15),
                CustomSeeMoreButton(onPressed: () {}),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: productEntity.products.length,
                  itemBuilder: (context, index) {
                    return CustomProductBox(
                      price: productEntity.products[index].price.toString(),
                      name: productEntity.products[index].title,
                      image:
                          NetworkImage(productEntity.products[index].images[0]),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
