import 'categories_model.dart';

class CategoriesResponsesModel {
  bool? success;
  List<CategoryModel>? categories;

  CategoriesResponsesModel({this.success, this.categories});

  CategoriesResponsesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] ??= false;
    json['Categories'] ??= [];
    if (success!) {
      categories = <CategoryModel>[];
      for (var category in json['Categories']) {
        categories!.add(CategoryModel.fromJson(category));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (categories != null) {
      data['Categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
