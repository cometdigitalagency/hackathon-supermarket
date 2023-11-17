import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:save_mart/config/di/config_dependencies.dart';
import 'package:save_mart/config/routes/routes.dart';
import 'package:save_mart/config/routes/routes.gr.dart';

Future<void> main() async {
  await configDependencies();
  return runApp(App());
}

class App extends StatelessWidget {
  final _appRouter = getIt<AppRouter>();
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(
        deepLinkBuilder: (_) =>
            const DeepLink([PageRouteInfo(LoginRoute.name)]),
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
