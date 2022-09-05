import 'package:emenu/data_layer/navigation_service/navigation_service.dart';
import 'package:emenu/presentation_layer/resources/route_manager.dart';
import 'package:emenu/service_locator.dart';

import 'data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum LoginStatus { success, wrong, empty }

class AuthenticationProvider with ChangeNotifier {
  bool _loading = false;

  bool get isLoading => _loading;
  set setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  Map<String, String> get testUser => {
        'username': '100',
        'password': '100',
      };

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<LoginStatus> login() async {
    if (username.text.isEmpty || password.text.isEmpty) {
      return LoginStatus.empty;
    }
    setLoading = true;
    LoginStatus check = LoginStatus.wrong;

    // await Future.delayed(const Duration(seconds: 2), () {
    if (username.text == testUser['username'] &&
        password.text == testUser['password']) {
      check = LoginStatus.success;
    } else {
      setLoading = false;
      check = LoginStatus.wrong;
    }
    // });
    return check;
  }

  Future getAllData(BuildContext context) async {
    await Provider.of<DataViewModel>(context, listen: false).getAllData();
    setLoading = false;
    serviceLocator<NavigationService>().replaceNavigateTo(Routes.homeRoute);
  }
}
