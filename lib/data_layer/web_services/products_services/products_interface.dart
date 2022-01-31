import '../../models/products_response_model.dart';

abstract class ProductServiceInterface {
  Future<ProductsResponseModel> getProducts();
}
