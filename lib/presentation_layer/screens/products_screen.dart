import 'dart:developer';

import 'package:emenu/business_logic_layer/provider/application_provider.dart';
import 'package:emenu/data_layer/models/navigation_args_model.dart';
import 'package:emenu/presentation_layer/resources/color_manager.dart';
import 'package:emenu/presentation_layer/resources/font_manager.dart';
import 'package:emenu/presentation_layer/resources/route_manager.dart';
import 'package:emenu/presentation_layer/resources/string_manager.dart';
import 'package:emenu/presentation_layer/resources/style_manager.dart';
import 'package:emenu/presentation_layer/resources/value_manager.dart';
import 'package:emenu/presentation_layer/widgets/appbar.dart';
import 'package:emenu/presentation_layer/widgets/product_card.dart';
import 'package:emenu/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  final NavigationArguments navigationArguments;
  const ProductsScreen({Key? key, required this.navigationArguments})
      : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool isList = true;

  @override
  Widget build(BuildContext context) {
    log(widget.navigationArguments.categoryId!.toString());
    ApplicationProvider applicationProvider =
        Provider.of<ApplicationProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget(
          backAllowed: true,
          routeName: Routes.homeRoute,
          context: context,
          actions: [
            if (isList)
              GestureDetector(
                onTap: () {
                  setState(() {
                    isList = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.grid_on,
                    color: ColorManager.white,
                    size: AppSize.s28,
                  ),
                ),
              )
            else
              GestureDetector(
                onTap: () {
                  setState(() {
                    isList = true;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.list,
                    color: ColorManager.white,
                    size: AppSize.s28,
                  ),
                ),
              )
          ],
        ),
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
                    const FaIcon(FontAwesomeIcons.store),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: AppPadding.p4),
                      child: Text(
                        StringManager.products,
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
                child: applicationProvider.productsModel.items!
                        .where((element) =>
                            element.categoryId ==
                            widget.navigationArguments.categoryId)
                        .isEmpty
                    ? Center(
                        child: Text(
                          StringManager.noProducts,
                          style: getMediumStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s18,
                          ),
                        ),
                      )
                    : isList
                        ? ListView.separated(
                            shrinkWrap: true,
                            addAutomaticKeepAlives: false,
                            padding: EdgeInsets.zero,
                            itemCount: applicationProvider.productsModel.items!
                                .where((element) =>
                                    element.categoryId ==
                                    widget.navigationArguments.categoryId)
                                .length,
                            separatorBuilder: (context, index) {
                              log(applicationProvider
                                  .productsModel.items![index].categoryId!
                                  .toString());
                              return Divider(
                                color: ColorManager.greyWithOpacity80,
                              );
                            },
                            itemBuilder: (BuildContext ctx, index) {
                              return ProductCard(
                                product: applicationProvider
                                    .productsModel.items!
                                    .where((element) =>
                                        element.categoryId ==
                                        widget.navigationArguments.categoryId)
                                    .toList()[index],
                              );
                            })
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
                            itemCount: applicationProvider.productsModel.items!
                                .where((element) =>
                                    element.categoryId ==
                                    widget.navigationArguments.categoryId)
                                .length,
                            itemBuilder: (BuildContext ctx, index) {
                              return ProductCard(
                                product: applicationProvider
                                    .productsModel.items!
                                    .where((element) =>
                                        element.categoryId ==
                                        widget.navigationArguments.categoryId)
                                    .toList()[index],
                                horizontal: false,
                              );
                            }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
