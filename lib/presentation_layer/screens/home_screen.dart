import 'package:easy_localization/easy_localization.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/string_manager.dart';
import '../resources/style_manager.dart';
import '../resources/value_manager.dart';
import '../widgets/appbar.dart';
import '../widgets/emenu_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../business_logic_layer/provider/data_provider.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
          body: Consumer<DataViewModel>(builder: (context, dataProvider, _) {
            return Padding(
              padding: const EdgeInsetsDirectional.only(
                start: AppPadding.p4,
                top: AppPadding.p20,
                end: AppPadding.p4,
                // bottom: AppPadding.p16,
              ),
              child: dataProvider.dataLoading
                  ? SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                bottom: AppPadding.p12),
                            child: SpinKitWave(
                              color: ColorManager.primary,
                            ),
                          ),
                          Text(
                            StringManager().loading,
                            style: getMediumStyle(
                              color: ColorManager.primary,
                              fontSize: FontSize.s18,
                            ),
                          )
                        ],
                      ),
                    )
                  : Column(
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
                                  StringManager().categories,
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
                          child: dataProvider.dataLoading
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SpinKitWave(
                                        color: ColorManager.primary,
                                        size: AppSize.s34,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                          top: AppPadding.p12,
                                        ),
                                        child: Text(
                                          StringManager().loading,
                                          style: getMediumStyle(
                                            color: ColorManager.black,
                                            fontSize: FontSize.s18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : dataProvider.categoriesModel.categories!.isEmpty
                                  ? Center(
                                      child: Text(
                                        StringManager().noCategories,
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
                                      itemCount: dataProvider
                                          .categoriesModel.categories!.length,
                                      itemBuilder: (BuildContext ctx, index) {
                                        return CategoryCardWidget(
                                          category: dataProvider.categoriesModel
                                              .categories![index],
                                        );
                                      }),
                        ),
                      ],
                    ),
            );
          }),
        ),
      ),
    );
  }
}
