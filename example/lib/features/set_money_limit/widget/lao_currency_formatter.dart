import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSetMoneyField extends StatelessWidget {
  final TextEditingController controller;
  const CustomSetMoneyField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        hintText: '10,000 KIP',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red)),
      ),
      validator: (value) {
        if (value == "") {
          return 'ກະລຸນາປ້ອນຈຳນວນເງີນຂອງທ່ານ!!';
        }
        return null;
      },
    );
  }
}
