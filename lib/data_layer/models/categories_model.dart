class CategoriesModel {
  bool? success;
  List<Categories>? categories;

  CategoriesModel({this.success, this.categories});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['Categories'] != null) {
      categories = <Categories>[];
      json['Categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
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

class Categories {
  int? id;
  String? arabicName;
  String? name;
  String? imgurl;

  Categories({this.id, this.arabicName, this.name, this.imgurl});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arabicName = json['arabic_name'];
    name = json['name'];
    imgurl = json['imgurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['arabic_name'] = arabicName;
    data['name'] = name;
    data['imgurl'] = imgurl;
    return data;
  }
}
