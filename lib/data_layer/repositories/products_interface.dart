import 'package:emenu/data_layer/models/products_model.dart';

abstract class ProductInterface {
  Future<ProductsModel> getProducts();
}
