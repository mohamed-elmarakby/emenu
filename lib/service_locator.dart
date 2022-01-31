import 'package:emenu/data_layer/navigation_service/navigation_service.dart';
import 'package:emenu/data_layer/web_services/category_services/categories_interface.dart';
import 'package:emenu/data_layer/web_services/products_services/products_interface.dart';
import 'package:emenu/data_layer/web_services/category_services/http_categories_web_services.dart';
import 'package:emenu/data_layer/web_services/products_services/http_products_web_services.dart';

import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void setupGetIt() {
  //Products Services
  // serviceLocator
  //     .registerSingleton<ProductServiceInterface>(DioProductWebServices());
  serviceLocator
      .registerSingleton<ProductServiceInterface>(HttpProductWebServices());

  //Category Services
  // serviceLocator
  //     .registerSingleton<CategoryServiceInterface>(DioCategoryWebServices());
  serviceLocator
      .registerSingleton<CategoryServiceInterface>(HttpCategoryWebServices());

  //Navigation Service
  serviceLocator.registerSingleton<NavigationService>(NavigationService());
}
