import 'package:flutter/material.dart';

class CustomSeeMoreButton extends StatelessWidget {
  final Function() onPressed;
  const CustomSeeMoreButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "ລາຍການສິນຄ້າ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text(
            "ເບິ່ງທັງໝົດ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
