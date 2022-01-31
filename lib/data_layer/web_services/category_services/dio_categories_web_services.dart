import 'package:dio/dio.dart';
import 'package:emenu/data_layer/models/categories_response_model.dart';
import 'package:emenu/data_layer/web_services/category_services/categories_interface.dart';
import 'package:emenu/presentation_layer/resources/string_manager.dart';

class DioCategoryWebServices implements CategoryServiceInterface {
  late Dio dio;
  DioCategoryWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: StringManager.baseUrl,
      headers: {
        'Accept': 'application/json',
      },
      receiveDataWhenStatusError: true,
      connectTimeout: 20000,
      receiveTimeout: 20000,
    );

    dio = Dio(options);
  }

  @override
  Future<CategoriesResponsesModel> getCategories() async {
    final response = await dio.get(StringManager.categoriesKey);
    if (response.statusCode == 200) {
      return CategoriesResponsesModel.fromJson(response.data);
    } else {
      return CategoriesResponsesModel(success: false);
    }
  }
}
