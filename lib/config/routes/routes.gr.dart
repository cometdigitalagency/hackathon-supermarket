// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:save_mart/features/auth/login/presentation/login_screen.dart'
    as _i2;
import 'package:save_mart/features/home/domain/entities/response_product_entity.dart'
    as _i7;
import 'package:save_mart/features/home/presentation/home_screen.dart' as _i1;
import 'package:save_mart/features/product_cart/presentation/product_cart_screen.dart'
    as _i3;
import 'package:save_mart/features/view_product/presentation/view_product_screen.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i1.HomeScreen()),
      );
    },
    LoginRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i2.LoginScreen()),
      );
    },
    ProductCartRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ProductCartScreen(),
      );
    },
    ViewProductRoute.name: (routeData) {
      final args = routeData.argsAs<ViewProductRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ViewProductScreen(
          key: args.key,
          amountMoney: args.amountMoney,
          productEntity: args.productEntity,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ProductCartScreen]
class ProductCartRoute extends _i5.PageRouteInfo<void> {
  const ProductCartRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ProductCartRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductCartRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ViewProductScreen]
class ViewProductRoute extends _i5.PageRouteInfo<ViewProductRouteArgs> {
  ViewProductRoute({
    _i6.Key? key,
    required String amountMoney,
    _i7.ResponseProductEntity? productEntity,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ViewProductRoute.name,
          args: ViewProductRouteArgs(
            key: key,
            amountMoney: amountMoney,
            productEntity: productEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewProductRoute';

  static const _i5.PageInfo<ViewProductRouteArgs> page =
      _i5.PageInfo<ViewProductRouteArgs>(name);
}

class ViewProductRouteArgs {
  const ViewProductRouteArgs({
    this.key,
    required this.amountMoney,
    this.productEntity,
  });

  final _i6.Key? key;

  final String amountMoney;

  final _i7.ResponseProductEntity? productEntity;

  @override
  String toString() {
    return 'ViewProductRouteArgs{key: $key, amountMoney: $amountMoney, productEntity: $productEntity}';
  }
}
