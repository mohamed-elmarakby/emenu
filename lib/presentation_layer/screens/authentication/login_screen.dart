import '../../../business_logic_layer/provider/authentication_provider.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/string_manager.dart';
import '../../resources/style_manager.dart';
import '../../resources/value_manager.dart';
import '../../widgets/appbar.dart';
import '../../widgets/emenu_button.dart';
import '../../widgets/emenu_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authenticationProvider = context.read<AuthenticationProvider>();

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
                StringManager().username,
                textAlign: TextAlign.start,
                style: getMediumStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.white,
                ),
              ),
              EMenuFormFieldWidget(
                label: StringManager().username,
                controller: authenticationProvider.username,
                hint: StringManager().usernameExample,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: AppPadding.p16),
                child: Text(
                  StringManager().password,
                  textAlign: TextAlign.start,
                  style: getMediumStyle(
                    fontSize: FontSize.s16,
                    color: ColorManager.white,
                  ),
                ),
              ),
              EMenuFormFieldWidget(
                label: StringManager().password,
                controller: authenticationProvider.password,
                isPassword: true,
                hint: StringManager().passwordExample,
              ),
              Consumer<AuthenticationProvider>(
                  builder: (context, authProvider, _) {
                return EMenuButtonWidget(
                  title: StringManager().login,
                  loading: authProvider.isLoading,
                  onPressed: () async {
                    if (authProvider.isLoading) {
                      return;
                    } else {
                      LoginStatus status = await authProvider.login();
                      switch (status) {
                        case LoginStatus.empty:
                          var snackBar = SnackBar(
                            content: Text(StringManager().noEmpty),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          break;
                        case LoginStatus.success:
                          await authProvider.getAllData(context);
                          break;
                        case LoginStatus.wrong:
                          var snackBar = SnackBar(
                            content: Text(StringManager().notRight),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          break;
                        default:
                      }
                    }
                  },
                  color: ColorManager.black,
                  style: getMediumStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s16,
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
