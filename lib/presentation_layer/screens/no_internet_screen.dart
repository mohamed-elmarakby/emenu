import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/string_manager.dart';
import '../resources/style_manager.dart';
import 'package:flutter/material.dart';

class NoInternetPageView extends StatelessWidget {
  const NoInternetPageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AssetsManager.noConnection,
                fit: BoxFit.contain,
              ),
              Text(
                StringManager().noConnection,
                style: getBoldStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
