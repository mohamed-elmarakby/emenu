import 'dart:convert';
import 'dart:developer';

import 'package:emenu/data_layer/models/navigation_args_model.dart';
import 'package:emenu/presentation_layer/resources/color_manager.dart';
import 'package:emenu/presentation_layer/resources/style_manager.dart';
import 'package:emenu/presentation_layer/resources/value_manager.dart';
import 'package:emenu/presentation_layer/screens/authentication/login_screen.dart';
import 'package:emenu/presentation_layer/screens/home_screen.dart';
import 'package:emenu/presentation_layer/screens/products_screen.dart';
import 'package:emenu/presentation_layer/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'string_manager.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
  static const String productsRoute = '/products';
}

class RouterGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(
            builder: (_) => Builder(builder: (_) => const LoginScreen()));
      case Routes.homeRoute:
        return MaterialPageRoute(
            builder: (_) => Builder(builder: (_) => const HomeScreen()));
      case Routes.productsRoute:
        return MaterialPageRoute(
            builder: (_) => Builder(
                builder: (_) => ProductsScreen(
                      navigationArguments:
                          routeSettings.arguments! as NavigationArguments,
                    )));
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
            StringManager.noRoute,
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
