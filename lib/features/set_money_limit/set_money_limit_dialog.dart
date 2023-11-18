import 'package:flutter/material.dart';
import 'package:save_mart/config/di/config_dependencies.dart';
import 'package:save_mart/config/routes/routes.dart';
import 'package:save_mart/config/routes/routes.gr.dart';
import 'package:save_mart/features/set_money_limit/widget/custom_button.dart';
import 'package:save_mart/features/set_money_limit/widget/lao_currency_formatter.dart';

void setMoneyLimitDialog(BuildContext context) async {
  final formKey = GlobalKey<FormState>();
  final enterMoney = TextEditingController();
  showDialog(
      context: context,
      builder: (context) {
        var customSetMoneyField = CustomSetMoneyField(
          controller: enterMoney,
        );
        return SimpleDialog(
          children: [
            const Text(
              "ກະລຸນາປ້ອນຈຳນວນເງີນ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              child: Form(
                key: formKey,
                child: customSetMoneyField,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              child: CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate() != false) {
                    final amountMoney = enterMoney.text.trim();
                    getIt<AppRouter>()
                        .push(ViewProductRoute(amountMoney: amountMoney));
                    Navigator.pop(context);
                  }
                },
                title: 'ຕົກລົງ',
              ),
            )
          ],
        );
      });
}
