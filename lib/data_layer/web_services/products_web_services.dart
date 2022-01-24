import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:emenu/data_layer/models/products_model.dart';
import 'package:emenu/data_layer/repositories/products_interface.dart';
import 'package:emenu/presentation_layer/resources/string_manager.dart';

class ProductWebServices implements ProductInterface {
  late Dio dio;
  ProductWebServices() {
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
  Future<ProductsModel> getProducts() async {
    final response = await dio.get(StringManager.productsKey);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(response.data);
    } else {
      return ProductsModel(success: false);
    }
  }
}
