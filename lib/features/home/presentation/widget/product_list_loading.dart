import 'package:flutter/material.dart';
import 'package:save_mart/features/home/presentation/widget/custom_banner_slide.dart';
import 'package:save_mart/features/home/presentation/widget/custom_choice_box.dart';
import 'package:save_mart/features/widget/custom_search_box.dart';
import 'package:shimmer/shimmer.dart';

class ProductListLoading extends StatelessWidget {
  const ProductListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE0E0E0),
      highlightColor: const Color(0xFFF5F5F5),
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
                onPressed: () {},
                title: 'ເບິ່ງສິນຄ້າຕາມວົງເງີນ',
                icon: Icons.shopify_rounded,
              )),
            ],
          ),
        ],
      ),
    );
  }
}
