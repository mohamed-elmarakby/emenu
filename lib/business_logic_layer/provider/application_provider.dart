import 'dart:convert';
import 'dart:developer';
import 'package:emenu/data_layer/models/categories_model.dart';
import 'package:emenu/data_layer/models/products_model.dart';
import 'package:emenu/data_layer/repositories/categories_interface.dart';
import 'package:emenu/data_layer/repositories/products_interface.dart';
import 'package:emenu/data_layer/web_services/categories_web_services.dart';
import 'package:emenu/data_layer/web_services/products_web_services.dart';
import 'package:emenu/service_locator.dart';
import 'package:flutter/material.dart';

class ApplicationProvider
    with ChangeNotifier
    implements ProductInterface, CategoryInterface {
  ProductsModel productsModel = ProductsModel(items: [], success: false);
  CategoriesModel categoriesModel =
      CategoriesModel(categories: [], success: false);
  CategoryInterface categoryInterface = serviceLocator<CategoryWebServices>();
  ProductInterface productInterface = serviceLocator<ProductWebServices>();

  @override
  Future<CategoriesModel> getCategories() async {
    var tempCategories = await categoryInterface.getCategories();
    notifyListeners();
    return tempCategories;
  }

  @override
  Future<ProductsModel> getProducts() async {
    var tempProducts = await productInterface.getProducts();
    notifyListeners();
    return tempProducts;
  }

  Future getAllData() async {
    log('Getting Categories');
    categoriesModel = await getCategories();
    log('Done Getting Categories');
    log('Done Getting Products');
    productsModel = await getProducts();
    log('Done Getting Products');
    log(json.encode(productsModel));
    notifyListeners();
  }
}
