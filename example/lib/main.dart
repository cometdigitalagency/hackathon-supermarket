import 'package:auto_route/auto_route.dart';
import 'package:example/config/di/config_dependencies.dart';
import 'package:example/config/routes/routes.dart';
import 'package:example/config/routes/routes.gr.dart';
import 'package:example/core/constants/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:save_mart/save_mart.dart';

Future<void> main() async {
  await configDependencies();
  return runApp(App());
}

class App extends StatelessWidget {
  final _appRouter = getIt<AppRouter>();
  final test = FlitterProductByPrice();
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(primaryColor: ColorConstants.mainColor),
      routerDelegate: _appRouter.delegate(
        deepLinkBuilder: (_) => const DeepLink([PageRouteInfo(HomeRoute.name)]),
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
