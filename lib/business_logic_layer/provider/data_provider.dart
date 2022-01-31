import '../../data_layer/models/categories_response_model.dart';
import '../../data_layer/models/items_model.dart';
import '../../data_layer/models/products_response_model.dart';
import '../../data_layer/web_services/category_services/categories_interface.dart';
import '../../data_layer/web_services/products_services/products_interface.dart';
import '../../service_locator.dart';
import 'package:flutter/material.dart';

class DataViewModel with ChangeNotifier {
  //Declarations
  ProductsResponseModel _productsModel =
      ProductsResponseModel(items: [], success: false);
  List<ItemModel> _favoriteList = [];
  List<ItemModel> _chosenCategoryItemsList = [];
  bool _dataLoading = false;
  bool _isList = false;
  CategoriesResponsesModel _categoriesModel =
      CategoriesResponsesModel(categories: [], success: false);
  final CategoryServiceInterface _categoryInterface =
      serviceLocator<CategoryServiceInterface>();
  final ProductServiceInterface _productInterface =
      serviceLocator<ProductServiceInterface>();

  //Getters
  ProductsResponseModel get productModel => _productsModel;
  set setProductModel(newProductModel) {
    _productsModel = newProductModel;
    notifyListeners();
  }

  List<ItemModel> get favoriteList => _favoriteList;
  set setFavoriteList(newFavoriteList) {
    _favoriteList = newFavoriteList;
    notifyListeners();
  }

  List<ItemModel> get categoryItemsList => _chosenCategoryItemsList;
  setCategoryItemsList(int categoryId) {
    _chosenCategoryItemsList = productModel.items!
        .where((element) => element.categoryId == categoryId)
        .toList();
    notifyListeners();
  }

  bool get dataLoading => _dataLoading;
  setDataLoading(loading) {
    _dataLoading = loading;
    notifyListeners();
  }

  bool get isList => _isList;
  setisList(isList) {
    _isList = isList;
    notifyListeners();
  }

  CategoriesResponsesModel get categoriesModel => _categoriesModel;

  //Setters
  set setCategoriesModel(newCategoriesModel) {
    _categoriesModel = newCategoriesModel;
    notifyListeners();
  }

  //Functions
  addToFavoriteList(ItemModel favoriteItem) {
    //the following line sets the attribute liked of the item to true if its value equals null
    favoriteItem.liked ??= favoriteItem.liked = true;
    favoriteItem.liked = true;
    _favoriteList.add(favoriteItem);
    notifyListeners();
  }

  removeFromFavoriteList(ItemModel removeFavoriteItem) {
    //the following line sets the attribute liked of the item to true if its value equals null
    removeFavoriteItem.liked ??= removeFavoriteItem.liked = false;
    removeFavoriteItem.liked = false;
    _favoriteList.remove(removeFavoriteItem);
    notifyListeners();
  }

  //Communication with services
  Future<CategoriesResponsesModel> _getCategories() async {
    var tempCategories = await _categoryInterface.getCategories();
    return tempCategories;
  }

  Future<ProductsResponseModel> _getProducts() async {
    var tempProducts = await _productInterface.getProducts();
    return tempProducts;
  }

  Future getAllData() async {
    setDataLoading(true);
    setCategoriesModel = await _getCategories();
    setProductModel = await _getProducts();
    setDataLoading(false);
    notifyListeners();
  }
}
