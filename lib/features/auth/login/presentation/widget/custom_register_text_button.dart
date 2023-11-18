import 'package:flutter/material.dart';

class CustomRegisterTextButton extends StatelessWidget {
  const CustomRegisterTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("ຍັງບໍ່ທັນມີບັນຊີ?"),
        TextButton(
            onPressed: () {},
            child: const Text(
              "ລົງທະບຽນ",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ))
      ],
    );
  }
}
