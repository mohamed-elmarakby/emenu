import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:emenu/data_layer/models/categories_model.dart';
import 'package:emenu/data_layer/models/products_model.dart';
import 'package:emenu/data_layer/repositories/categories_interface.dart';
import 'package:emenu/data_layer/web_services/categories_web_services.dart';
import 'package:emenu/presentation_layer/resources/assets_manager.dart';
import 'package:emenu/presentation_layer/resources/color_manager.dart';
import 'package:emenu/presentation_layer/resources/font_manager.dart';
import 'package:emenu/presentation_layer/resources/string_manager.dart';
import 'package:emenu/presentation_layer/resources/style_manager.dart';
import 'package:emenu/presentation_layer/resources/value_manager.dart';
import 'package:emenu/presentation_layer/widgets/appbar.dart';
import 'package:emenu/presentation_layer/widgets/emenu_card.dart';
import 'package:emenu/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../business_logic_layer/provider/application_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (context
          .read<ApplicationProvider>()
          .categoriesModel
          .categories!
          .isNotEmpty) {
        return;
      }
      setState(() {
        isLoading = true;
      });
      context.read<ApplicationProvider>().getAllData().then((value) {
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var applicationProvider = context.read<ApplicationProvider>();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: appBarWidget(actions: [
            Padding(
              padding: const EdgeInsetsDirectional.all(AppPadding.p8),
              child: GestureDetector(
                onTap: () async {
                  if (context.locale == const Locale('en')) {
                    await context.setLocale(const Locale('ar'));
                  } else {
                    await context.setLocale(const Locale('en'));
                  }
                },
                child: Icon(
                  Icons.translate,
                  color: ColorManager.white,
                ),
              ),
            )
          ]),
          body: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: AppPadding.p4,
              top: AppPadding.p20,
              end: AppPadding.p4,
              // bottom: AppPadding.p16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: Row(
                    children: [
                      const FaIcon(FontAwesomeIcons.tags),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: AppPadding.p4),
                        child: Text(
                          StringManager.categories,
                          style: getBoldStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: applicationProvider.categoriesModel.categories!.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SpinKitWave(
                                color: ColorManager.primary,
                                size: AppSize.s34,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  top: AppPadding.p12,
                                ),
                                child: Text(
                                  StringManager.loading,
                                  style: getMediumStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : applicationProvider.categoriesModel.categories!.isEmpty
                          ? Center(
                              child: Text(
                                StringManager.noCategories,
                                style: getMediumStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s18,
                                ),
                              ),
                            )
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                // crossAxisSpacing: 2,
                                // mainAxisSpacing: 2,
                              ),
                              shrinkWrap: true,
                              addAutomaticKeepAlives: false,
                              padding: EdgeInsets.zero,
                              itemCount: applicationProvider
                                  .categoriesModel.categories!.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return CategoryCard(
                                  category: applicationProvider
                                      .categoriesModel.categories![index],
                                );
                              }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
