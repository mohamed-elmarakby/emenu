import 'package:emenu/presentation_layer/resources/color_manager.dart';
import 'package:emenu/presentation_layer/resources/font_manager.dart';
import 'package:emenu/presentation_layer/resources/style_manager.dart';
import 'package:emenu/presentation_layer/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EMenuButton extends StatefulWidget {
  void Function()? onPressed;
  String? title;
  bool loading;
  TextStyle? style;
  Color? color;
  EMenuButton({
    Key? key,
    this.color,
    this.loading = false,
    this.style,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<EMenuButton> createState() => _EMenuButtonState();
}

class _EMenuButtonState extends State<EMenuButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: AppPadding.p12,
        bottom: AppPadding.p12,
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          primary: widget.color ?? ColorManager.primary,
        ),
        child: widget.loading
            ? Center(
                child:
                    SpinKitWave(color: ColorManager.white, size: AppSize.s18),
              )
            : Text(
                widget.title!,
                style: widget.style ??
                    getMediumStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.s14,
                    ),
              ),
      ),
    );
  }
}
