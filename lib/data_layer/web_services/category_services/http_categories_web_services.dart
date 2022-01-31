import 'dart:convert';

import 'package:emenu/data_layer/models/categories_response_model.dart';
import 'package:emenu/data_layer/web_services/category_services/categories_interface.dart';
import 'package:emenu/presentation_layer/resources/string_manager.dart';
import 'package:http/http.dart' as http;

class HttpCategoryWebServices implements CategoryServiceInterface {
  @override
  Future<CategoriesResponsesModel> getCategories() async {
    var response = await http
        .get(Uri.parse(StringManager.baseUrl + StringManager.categoriesKey));
    return CategoriesResponsesModel.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)));
  }
}
