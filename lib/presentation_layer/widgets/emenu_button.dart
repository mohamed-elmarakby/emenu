import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/style_manager.dart';
import '../resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EMenuButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String? title;
  final bool loading;
  final TextStyle? style;
  final Color? color;
  const EMenuButtonWidget({
    Key? key,
    this.color,
    this.loading = false,
    this.style,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: AppPadding.p12,
        bottom: AppPadding.p12,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color ?? ColorManager.primary,
        ),
        child: loading
            ? Center(
                child:
                    SpinKitWave(color: ColorManager.white, size: AppSize.s18),
              )
            : Text(
                title!,
                style: style ??
                    getMediumStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.s14,
                    ),
              ),
      ),
    );
  }
}
