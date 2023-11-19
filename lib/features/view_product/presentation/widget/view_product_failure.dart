import 'package:flutter/material.dart';

class ViewProductFailure extends StatelessWidget {
  final String message;
  const ViewProductFailure({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          message,
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
    );
  }
}
