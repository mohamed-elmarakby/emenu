import 'package:emenu/data_layer/models/products_model.dart';
import 'package:emenu/presentation_layer/resources/assets_manager.dart';
import 'package:emenu/presentation_layer/resources/color_manager.dart';
import 'package:emenu/presentation_layer/resources/font_manager.dart';
import 'package:emenu/presentation_layer/resources/style_manager.dart';
import 'package:emenu/presentation_layer/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductCard extends StatefulWidget {
  Items product;
  bool horizontal;
  ProductCard({Key? key, required this.product, this.horizontal = true})
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    showDetails() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Image.asset(
                    imagePath + widget.product.image!,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(AppPadding.p8),
                    child: Text(
                      widget.product.descrption!,
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

    return widget.horizontal
        ? GestureDetector(
            onTap: showDetails,
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
                          imagePath + widget.product.image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: ListTile(
                        title: Text(
                          context.locale == const Locale('en')
                              ? widget.product.name!
                              : widget.product.arabicName!,
                          style: getBoldStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14,
                          ),
                        ),
                        trailing: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.product.liked ??=
                                    widget.product.liked = true;

                                widget.product.liked = !widget.product.liked!;
                              });
                            },
                            child: Icon(
                              widget.product.liked == null ||
                                      widget.product.liked!
                                  ? FontAwesomeIcons.heart
                                  : FontAwesomeIcons.solidHeart,
                              color: ColorManager.red,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: showDetails,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridTile(
                header: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.product.liked ??= widget.product.liked = true;

                        widget.product.liked = !widget.product.liked!;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: ColorManager.white,
                      child: Icon(
                        widget.product.liked == null || widget.product.liked!
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
                            ? widget.product.name!
                            : widget.product.arabicName!,
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
                    imagePath + widget.product.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
  }
}
