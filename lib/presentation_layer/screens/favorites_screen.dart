import '../../business_logic_layer/provider/data_provider.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/route_manager.dart';
import '../resources/string_manager.dart';
import '../resources/style_manager.dart';
import '../resources/value_manager.dart';
import '../widgets/appbar.dart';
import '../widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class FavoritesScreenView extends StatelessWidget {
  const FavoritesScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<DataViewModel>(builder: (context, dataViewModel, _) {
        return Scaffold(
          appBar: appBarWidget(
            backAllowed: true,
            routeName: Routes.productsRoute,
            context: context,
            actions: [
              if (dataViewModel.isList)
                GestureDetector(
                  onTap: () {
                    dataViewModel.setisList(false);
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
                    dataViewModel.setisList(true);
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
                      const FaIcon(FontAwesomeIcons.solidHeart),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: AppPadding.p4),
                        child: Text(
                          StringManager().favorites,
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
                  child: dataViewModel.favoriteList.isEmpty
                      ? Center(
                          child: Text(
                            StringManager().noFavorites,
                            style: getMediumStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s18,
                            ),
                          ),
                        )
                      : dataViewModel.isList
                          ? ListView.separated(
                              shrinkWrap: true,
                              addAutomaticKeepAlives: false,
                              padding: EdgeInsets.zero,
                              itemCount: dataViewModel.favoriteList.length,
                              separatorBuilder: (context, index) {
                                return Divider(
                                  color: ColorManager.greyWithOpacity80,
                                );
                              },
                              itemBuilder: (BuildContext ctx, index) {
                                return ProductCardWidget(
                                  product: dataViewModel.favoriteList[index],
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
                              itemCount: dataViewModel.favoriteList.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return ProductCardWidget(
                                  product: dataViewModel.favoriteList[index],
                                );
                              }),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
