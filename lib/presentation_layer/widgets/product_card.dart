import '../../business_logic_layer/provider/data_provider.dart';
import '../../data_layer/models/items_model.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/style_manager.dart';
import '../resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

class ProductCardWidget extends StatelessWidget {
  final ItemModel product;
  const ProductCardWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.read<DataViewModel>().isList
        ? Consumer<DataViewModel>(builder: (context, dataViewModel, _) {
            return GestureDetector(
              onTap: () {
                _showDetails(context, product);
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.all(AppPadding.p8),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s10),
                          ),
                          child: Image.asset(
                            imagePath + product.image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: ListTile(
                          title: Text(
                            context.locale == const Locale('en')
                                ? product.name!
                                : product.arabicName!,
                            style: getBoldStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.s14,
                            ),
                          ),
                          trailing: GestureDetector(onTap: () {
                            product.liked ??= false;
                            !product.liked!
                                ? dataViewModel.addToFavoriteList(product)
                                : dataViewModel.removeFromFavoriteList(product);
                          }, child: Consumer<DataViewModel>(
                              builder: (context, dataViewModel, _) {
                            return Icon(
                              product.liked == null || !product.liked!
                                  ? FontAwesomeIcons.heart
                                  : FontAwesomeIcons.solidHeart,
                              color: ColorManager.red,
                            );
                          })),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          })
        : Consumer<DataViewModel>(builder: (context, dataViewModel, _) {
            return GestureDetector(
              onTap: () {
                _showDetails(context, product);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridTile(
                  header: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        product.liked ??= false;
                        !product.liked!
                            ? dataViewModel.addToFavoriteList(product)
                            : dataViewModel.removeFromFavoriteList(product);
                      },
                      child: CircleAvatar(
                        backgroundColor: ColorManager.white,
                        child: Icon(
                          product.liked == null || !product.liked!
                              ? FontAwesomeIcons.heart
                              : FontAwesomeIcons.solidHeart,
                          color: ColorManager.red,
                        ),
                      ),
                    ),
                  ),
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
                              ? product.name!
                              : product.arabicName!,
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
                      imagePath + product.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          });
  }
}

_showDetails(BuildContext context, ItemModel product) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Image.asset(
                imagePath + product.image!,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.all(AppPadding.p8),
                child: Text(
                  context.locale == const Locale('en')
                      ? product.descrption!
                      : product.arabicDescrption!,
                  style: getMediumStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s16,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
