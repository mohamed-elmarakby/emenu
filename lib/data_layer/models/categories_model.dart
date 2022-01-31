class CategoryModel {
  int? id;
  String? arabicName;
  String? name;
  String? imgurl;

  CategoryModel({this.id, this.arabicName, this.name, this.imgurl});

  CategoryModel.fromJson(Map<String, dynamic> json) {
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
