import '../../data_layer/navigation_service/navigation_service.dart';
import 'package:emenu/service_locator.dart';

import '../resources/string_manager.dart';

import '../resources/color_manager.dart';
import 'package:flutter/material.dart';

AppBar appBarWidget({
  backAllowed = false,
  List<Widget>? actions,
  BuildContext? context,
  var routeName,
  double elevation = 0,
}) {
  return AppBar(
    centerTitle: true,
    elevation: elevation,
    automaticallyImplyLeading: false,
    leading: !backAllowed
        ? null
        : IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: ColorManager.white,
            ),
            color: ColorManager.primary,
            onPressed: () => serviceLocator<NavigationService>()
                .replaceNavigateTo(routeName),
          ),
    title: Text(
      StringManager.appName,
    ),
    actions: actions,
  );
}
