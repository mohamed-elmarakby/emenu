import '../../models/categories_response_model.dart';

abstract class CategoryServiceInterface {
  Future<CategoriesResponsesModel> getCategories();
}
