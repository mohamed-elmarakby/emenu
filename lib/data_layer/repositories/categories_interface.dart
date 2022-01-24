import 'package:emenu/data_layer/models/categories_model.dart';

abstract class CategoryInterface {
  Future<CategoriesModel> getCategories();
}
