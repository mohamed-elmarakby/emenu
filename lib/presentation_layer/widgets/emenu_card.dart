import 'package:emenu/data_layer/models/categories_model.dart';
import 'package:emenu/data_layer/models/navigation_args_model.dart';
import 'package:emenu/presentation_layer/resources/assets_manager.dart';
import 'package:emenu/presentation_layer/resources/color_manager.dart';
import 'package:emenu/presentation_layer/resources/font_manager.dart';
import 'package:emenu/presentation_layer/resources/route_manager.dart';
import 'package:emenu/presentation_layer/resources/style_manager.dart';
import 'package:emenu/presentation_layer/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CategoryCard extends StatelessWidget {
  final Categories category;
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.productsRoute,
            arguments: NavigationArguments(categoryId: category.id));
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
