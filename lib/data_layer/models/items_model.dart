class ItemModel {
  int? id;
  int? categoryId;
  String? name;
  String? arabicName;
  String? descrption;
  String? arabicDescrption;
  int? price;
  String? image;
  bool? liked;

  ItemModel({
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

  ItemModel.fromJson(Map<String, dynamic> json) {
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
