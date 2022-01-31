import 'items_model.dart';

class ProductsResponseModel {
  bool? success;
  List<ItemModel>? items;

  ProductsResponseModel({this.success, this.items});

  ProductsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] ??= false;
    json['items'] ??= [];
    if (success!) {
      items = <ItemModel>[];
      json['items'].forEach((v) {
        items!.add(ItemModel.fromJson(v));
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
