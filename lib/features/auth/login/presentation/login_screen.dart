import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_mart/config/di/config_dependencies.dart';
import 'package:save_mart/core/constants/theme/color.dart';
import 'package:save_mart/features/auth/login/presentation/widget/custom_login_box.dart';
import 'package:save_mart/features/home/presentation/cubit/response_product_cubit.dart';

@RoutePage()
class LoginScreen extends StatelessWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SAVE MART",
              style: TextStyle(
                  color: ColorConstants.mainColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            CustomLogInbox()
          ],
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
