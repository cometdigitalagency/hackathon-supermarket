import 'package:example/core/constants/theme/color.dart';
import 'package:flutter/material.dart';

class CustomViewMoneyCard extends StatelessWidget {
  final double moneyAmount;
  const CustomViewMoneyCard({super.key, required this.moneyAmount});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorConstants.mainColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            children: [
              const Text(
                "ຈຳນວນເງີນ",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 15),
              Text(
                moneyAmount.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
