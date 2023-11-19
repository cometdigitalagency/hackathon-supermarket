import 'package:auto_route/auto_route.dart';
import 'package:example/config/routes/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ViewProductRoute.page),
        AutoRoute(page: ProductCartRoute.page),
      ];
}
