import 'package:emenu/presentation_layer/resources/color_manager.dart';
import 'package:emenu/presentation_layer/resources/font_manager.dart';
import 'package:emenu/presentation_layer/resources/route_manager.dart';
import 'package:emenu/presentation_layer/resources/string_manager.dart';
import 'package:emenu/presentation_layer/resources/style_manager.dart';
import 'package:emenu/presentation_layer/resources/value_manager.dart';
import 'package:emenu/presentation_layer/widgets/appbar.dart';
import 'package:emenu/presentation_layer/widgets/emenu_button.dart';
import 'package:emenu/presentation_layer/widgets/emenu_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map<String, String> users = {
    'username': '100',
    'password': '100',
  };
  bool loading = false;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget(),
        backgroundColor: ColorManager.primary,
        body: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: AppPadding.p8,
            top: AppPadding.p20,
            end: AppPadding.p8,
            bottom: AppPadding.p16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StringManager.username,
                textAlign: TextAlign.start,
                style: getMediumStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.white,
                ),
              ),
              EMenuFormField(
                label: StringManager.username,
                controller: username,
                hint: StringManager.usernameExample,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: AppPadding.p16),
                child: Text(
                  StringManager.password,
                  textAlign: TextAlign.start,
                  style: getMediumStyle(
                    fontSize: FontSize.s16,
                    color: ColorManager.white,
                  ),
                ),
              ),
              EMenuFormField(
                label: StringManager.password,
                controller: password,
                isPassword: true,
                hint: StringManager.passwordExample,
              ),
              EMenuButton(
                title: StringManager.login,
                loading: loading,
                onPressed: () {
                  if (loading) {
                    return;
                  } else if (username.text.isEmpty || password.text.isEmpty) {
                    var snackBar = SnackBar(
                      content: Text(StringManager.noEmpty),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  setState(() {
                    loading = true;
                  });
                  Future.delayed(const Duration(seconds: 2), () {
                    if (username.text == users['username'] &&
                        password.text == users['password']) {
                      setState(() {
                        loading = false;
                      });
                      Navigator.pushReplacementNamed(context, Routes.homeRoute);
                    } else {
                      setState(() {
                        loading = false;
                      });
                      var snackBar = SnackBar(
                        content: Text(StringManager.notRight),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                },
                color: ColorManager.black,
                style: getMediumStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.s16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
