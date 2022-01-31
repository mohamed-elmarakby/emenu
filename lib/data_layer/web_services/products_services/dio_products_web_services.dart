import 'package:dio/dio.dart';
import 'package:emenu/data_layer/models/products_response_model.dart';
import 'package:emenu/data_layer/web_services/products_services/products_interface.dart';
import 'package:emenu/presentation_layer/resources/string_manager.dart';

class DioProductWebServices implements ProductServiceInterface {
  late Dio dio;
  DioProductWebServices() {
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
  Future<ProductsResponseModel> getProducts() async {
    final response = await dio.get(StringManager.productsKey);
    if (response.statusCode == 200) {
      return ProductsResponseModel.fromJson(response.data);
    } else {
      return ProductsResponseModel(success: false);
    }
  }
}
