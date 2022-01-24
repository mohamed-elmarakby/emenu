import 'package:emenu/business_logic_layer/provider/application_provider.dart';
import 'package:emenu/data_layer/web_services/categories_web_services.dart';
import 'package:emenu/data_layer/web_services/products_web_services.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void setupGetIt() {
  serviceLocator.registerSingleton<ProductWebServices>(ProductWebServices());
  serviceLocator.registerSingleton<CategoryWebServices>(CategoryWebServices());
}
