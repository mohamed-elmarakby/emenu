import 'color_manager.dart';
import 'style_manager.dart';
import 'value_manager.dart';
import '../screens/authentication/login_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/home_screen.dart';
import '../screens/products_screen.dart';
import '../widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'string_manager.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
  static const String productsRoute = '/products';
  static const String favoritesRoute = '/favorites';
}

class RouterGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(
            builder: (_) => Builder(builder: (_) => const LoginScreenView()));
      case Routes.homeRoute:
        return MaterialPageRoute(
            builder: (_) => Builder(builder: (_) => const HomeScreenView()));
      case Routes.productsRoute:
        return MaterialPageRoute(builder: (_) => const ProductsScreenView());
      case Routes.favoritesRoute:
        return MaterialPageRoute(builder: (_) => const FavoritesScreenView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: appBarWidget(
          backAllowed: false,
          routeName: Routes.splashRoute,
        ),
        body: Center(
          child: Text(
            StringManager().noRoute,
            style: getBoldStyle(
              color: ColorManager.primary,
              fontSize: AppSize.s18,
            ),
          ),
        ),
      ),
    );
  }
}
