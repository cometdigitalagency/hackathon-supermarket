import 'package:flutter/material.dart';

class ProductListFailure extends StatelessWidget {
  final String message;
  const ProductListFailure({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          message,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.red),
        ),
      ),
    );
  }
}
