import 'dart:convert';

import 'package:emenu/data_layer/models/products_response_model.dart';
import 'package:emenu/data_layer/web_services/products_services/products_interface.dart';
import 'package:emenu/presentation_layer/resources/string_manager.dart';
import 'package:http/http.dart' as http;

class HttpProductWebServices implements ProductServiceInterface {
  @override
  Future<ProductsResponseModel> getProducts() async {
    var response = await http
        .get(Uri.parse(StringManager.baseUrl + StringManager.productsKey));

    return ProductsResponseModel.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)));
  }
}
