import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emenu/business_logic_layer/provider/application_provider.dart';
import 'package:emenu/presentation_layer/resources/color_manager.dart';
import 'package:emenu/presentation_layer/resources/route_manager.dart';
import 'package:emenu/presentation_layer/resources/string_manager.dart';
import 'package:emenu/presentation_layer/resources/theme_manager.dart';
import 'package:emenu/presentation_layer/screens/no_internet_screen.dart';
import 'package:emenu/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupGetIt();
  serviceLocator.allReady();
  runApp(MultiProvider(
    providers: [
      ListenableProvider<ApplicationProvider>(
          create: (_) => ApplicationProvider())
    ],
    child: EasyLocalization(
        supportedLocales: const [
          Locale(
            'en',
          ),
          Locale(
            'ar',
          )
        ],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('en', 'US'),
        child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorManager.primary.withOpacity(0.8),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: ColorManager.black,
      systemNavigationBarDividerColor: ColorManager.white,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return ChangeNotifierProvider<ApplicationProvider>(
      create: (context) => ApplicationProvider(),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: getApplicationThemeData(),
        onGenerateRoute: RouterGenerator.getRoute,
        initialRoute: Routes.homeRoute,
        title: StringManager.appName,
        builder: (BuildContext context, Widget? child) {
          return StreamBuilder(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
              return snapshot.data != ConnectivityResult.none
                  ? Builder(
                      builder: (BuildContext context) {
                        return child!;
                      },
                    )
                  : const NoInternetPage(); // another material app for showing user he is offline
            },
          );
        },
      ),
    );
  }
}
