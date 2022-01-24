import 'package:emenu/presentation_layer/resources/color_manager.dart';
import 'package:emenu/presentation_layer/resources/font_manager.dart';
import 'package:emenu/presentation_layer/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EMenuFormField extends StatelessWidget {
  String? label;
  String? hint;
  TextEditingController? controller;
  bool isLong;
  bool isPassword;
  bool isNumberField;
  bool readOnly;
  EMenuFormField({
    Key? key,
    this.readOnly = false,
    this.isNumberField = false,
    this.isPassword = false,
    this.hint,
    this.isLong = false,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label',
          style: getMediumStyle(color: ColorManager.primaryWithOpacity40),
        ),
        TextField(
          controller: controller,
          cursorColor: ColorManager.primaryWithOpacity40,
          onEditingComplete: () {},
          readOnly: readOnly,
          enabled: !readOnly,
          keyboardType:
              isNumberField ? TextInputType.number : TextInputType.text,
          inputFormatters: isNumberField
              ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9,.-]'))]
              : [
                  FilteringTextInputFormatter.allow(
                      RegExp("[a-zA-Z0-9ا-يؤءئأإلأ -/'\"]"))
                ],
          maxLines: isLong ? 10 : 1,
          obscureText: isPassword,
          decoration: InputDecoration(
            fillColor: ColorManager.white,
            filled: true,
            hintText: hint,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.primaryWithOpacity40,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.primaryWithOpacity40,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.primaryWithOpacity40,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.primaryWithOpacity40,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.primaryWithOpacity40,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.primaryWithOpacity40,
              ),
            ),
            labelStyle: getRegularStyle(
              color: ColorManager.primaryWithOpacity40,
              fontSize: FontSize.s18,
            ),
            hintStyle: getRegularStyle(
              color: ColorManager.primaryWithOpacity40,
              fontSize: FontSize.s16,
            ),
            floatingLabelStyle: getMediumStyle(
              color: ColorManager.primaryWithOpacity40,
              fontSize: FontSize.s16,
            ),
          ),
          style: getMediumStyle(
            color: ColorManager.primary,
            fontSize: FontSize.s16,
          ),
        ),
      ],
    );
  }
}
