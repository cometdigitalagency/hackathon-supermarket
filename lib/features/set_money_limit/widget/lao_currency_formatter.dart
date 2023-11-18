import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:save_mart/features/set_money_limit/widget/money_format.dart';

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
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LaoCurrencyFormatter(),
      ],
      validator: (value) {
        if (value == "") {
          return 'ກະລຸນາປ້ອນຈຳນວນເງີນຂອງທ່ານ!!';
        }
        return null;
      },
    );
  }
}
