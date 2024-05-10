import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/9_product_get_api/model/catgory_model.dart';
import 'package:flutter_learning_demo/screen/dashboard/list_of_screen/9_product_get_api/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiHomeController extends GetxController {
  RxList<CategoryModel> categoryModel = RxList([]);
  RxList<ProductModel> productModel = RxList([]);
  RxList<ProductModel> filterProductModel = RxList([]);
  RxBool isNameFound = RxBool(false);
  RxnInt isSelectedIndex = RxnInt();
  Rx<TextEditingController> textEditingController = Rx(TextEditingController());
  RxBool isVisible = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    loadCategory();
    loadProduct();
  }

  fetchCategoryApi() async {
    final response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/categories/'));

    if (response.statusCode == 200) {
      //'[{"id": 1}, {"id": 2} ]';
      return List<CategoryModel>.from(json.decode(response.body).map((x) => CategoryModel.fromJson(x)));
    } else {
      throw Exception('Failed to load data');
    }
  }

  loadCategory() async {
    var categoryData = await fetchCategoryApi();
    categoryModel.value = categoryData ?? [];
    print("Response Category ${categoryModel.toString()}");
  }

  fetchProductApi() async {
    final response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products/'));

    if (response.statusCode == 200) {
      //'[{"id": 1}, {"id": 2} ]';
      return List<ProductModel>.from(json.decode(response.body).map((x) => ProductModel.fromJson(x)));
    } else {
      throw Exception('Failed to load data');
    }
  }

  void loadProduct() async {
    var productData = await fetchProductApi();
    productModel.value = productData ?? [];
    print("Response Product ${productModel.toString()}");
  }

  onCategoryClick({required String categoryName}){
    isNameFound.value = true;
    print("onSelect $categoryName");
    filterProductModel.clear();
    for(var value in productModel){
      if(categoryName == value.category?.name){
        filterProductModel.add(value);
      }
      print(filterProductModel.toString());
    }
  }

   filterProductByPrice(String price){
    filterProductModel.value = productModel.where((p0) => p0.price.toString().contains(price)).toList();
    update();
  }

}
