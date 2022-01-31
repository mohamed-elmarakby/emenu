import 'dart:convert';
import 'dart:developer';

import 'package:emenu/data_layer/navigation_service/navigation_service.dart';
import 'package:emenu/service_locator.dart';

import '../../business_logic_layer/provider/data_provider.dart';
import '../../data_layer/models/categories_model.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/route_manager.dart';
import '../resources/style_manager.dart';
import '../resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

class CategoryCardWidget extends StatelessWidget {
  final CategoryModel category;
  const CategoryCardWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(jsonEncode(category));
    log(category.name.toString());
    log(category.arabicName.toString());

    return GestureDetector(
      onTap: () async {
        context.read<DataViewModel>().setCategoryItemsList(category.id!);
        serviceLocator<NavigationService>()
            .pushNavigateTo(Routes.productsRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridTile(
          footer: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppSize.s10),
                bottomRight: Radius.circular(AppSize.s10),
              ),
              color: ColorManager.black.withOpacity(
                0.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  context.locale == const Locale('en')
                      ? category.name!
                      : category.arabicName!,
                  style: getBoldStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s14,
                  ),
                ),
              ),
            ),
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s10),
              color: ColorManager.black.withOpacity(
                0.5,
              ),
            ),
            child: Image.asset(
              imagePath + category.imgurl!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
