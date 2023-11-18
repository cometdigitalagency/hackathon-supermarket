import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_mart/config/di/config_dependencies.dart';
import 'package:save_mart/config/routes/routes.dart';
import 'package:save_mart/config/routes/routes.gr.dart';
import 'package:save_mart/features/auth/login/presentation/widget/custom_register_text_button.dart';
import 'package:save_mart/features/home/presentation/cubit/response_product_cubit.dart';
import 'package:save_mart/features/set_money_limit/widget/custom_button.dart';
import 'package:save_mart/features/widget/custom_text_form_field.dart';

class CustomLogInbox extends StatelessWidget implements AutoRouteWrapper {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  CustomLogInbox({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "ເຂົ້າສູ່ລະບົບ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                  icon: Icons.person,
                  label: 'ຊື່ຜູ້ໃຊ້',
                  hintText: 'Username',
                  controller: usernameController,
                  obscureText: false),
              const SizedBox(height: 20),
              CustomTextField(
                  icon: Icons.password,
                  label: 'ລະຫັດຜ່ານ',
                  hintText: 'Password',
                  controller: passwordController,
                  obscureText: true),
              TextButton(onPressed: () {}, child: const Text("ລືມລະຫັດຜ່ານ?")),
              const SizedBox(height: 30),
              CustomButton(
                  title: 'ເຂົ້າສູ່ລະບົບ',
                  onPressed: () {
                    getIt<ResponseProductCubit>().fetchProduct();
                    getIt<AppRouter>().replaceAll([const HomeRoute()]);
                  }),
              const SizedBox(height: 8),
              const CustomRegisterTextButton(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ResponseProductCubit>()..initialFetchProductMethod(),
      child: this,
    );
  }
}
