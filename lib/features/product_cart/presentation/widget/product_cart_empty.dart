import 'package:flutter/material.dart';

class ProductCartEmpty extends StatelessWidget {
  const ProductCartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No have data.",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
    );
  }
}
