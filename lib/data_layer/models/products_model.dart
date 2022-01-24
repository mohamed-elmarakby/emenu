class ProductsModel {
  bool? success;
  List<Items>? items;

  ProductsModel({this.success, this.items});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  int? categoryId;
  String? name;
  String? arabicName;
  String? descrption;
  String? arabicDescrption;
  int? price;
  String? image;
  bool? liked;

  Items({
    this.id,
    this.categoryId,
    this.name,
    this.arabicName,
    this.descrption,
    this.arabicDescrption,
    this.price,
    this.image,
    this.liked = false,
  });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    arabicName = json['arabic_name'];
    descrption = json['descrption'];
    arabicDescrption = json['arabic_descrption'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['arabic_name'] = arabicName;
    data['descrption'] = descrption;
    data['arabic_descrption'] = arabicDescrption;
    data['price'] = price;
    data['image'] = image;
    return data;
  }
}
