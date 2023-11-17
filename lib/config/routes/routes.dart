import 'package:auto_route/auto_route.dart';
import 'package:save_mart/config/routes/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [AutoRoute(page: LoginRoute.page)];
}
