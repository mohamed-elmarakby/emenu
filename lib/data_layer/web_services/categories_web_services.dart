import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:emenu/data_layer/models/categories_model.dart';
import 'package:emenu/data_layer/repositories/categories_interface.dart';
import 'package:emenu/presentation_layer/resources/string_manager.dart';

class CategoryWebServices implements CategoryInterface {
  late Dio dio;
  CategoryWebServices() {
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
  Future<CategoriesModel> getCategories() async {
    final response = await dio.get(StringManager.categoriesKey);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      return CategoriesModel.fromJson(response.data);
    } else {
      return CategoriesModel(success: false);
    }
  }
}
