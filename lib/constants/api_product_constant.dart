// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:mikltea/models/api_product_model.dart';

class ApiConstants {
  static const String BASE_URL = "https://api.escuelajs.co/api/v1/products";
  static const String BASE_URL_CATEGORY = "https://api.escuelajs.co/api/v1/categories";

  static Future<List<ApiProduct>> getProduct() async {
    try {
      Response response = await Dio().get("$BASE_URL/?offset=0&limit=8");
      var getUsersData = response.data as List;
      var listProduct = getUsersData.map((i) => ApiProduct.fromJson(i)).toList();
      return listProduct;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  static Future<ApiProduct> getProductDetail(int id) async {

    try {
      Response response = await Dio().get("$BASE_URL/$id");
      var getUsersData = response.data;
      var listProduct = ApiProduct.fromJson(getUsersData);
      return listProduct;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  static Future<List<Category>> getCategory() async {
    try {
      Response response = await Dio().get(BASE_URL_CATEGORY);
      var getUsersData = response.data as List;
      var listCategory = getUsersData.map((i) => Category.fromJson(i)).toList();
      return listCategory;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  static Future<List<ApiProduct>> getCategoryById(int id) async {
    try {
      Response response = await Dio().get("$BASE_URL/?offset=0&limit=8&categoryId=$id");
      var getUsersData = response.data as List;
      var listCategory = getUsersData.map((i) => ApiProduct.fromJson(i)).toList();
      return listCategory;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  static Future<List<ApiProduct>> getListCart() async {
    try {
      Response response = await Dio().get("$BASE_URL/?offset=0&limit=3");
      var getUsersData = response.data as List;
      var listProduct = getUsersData.map((i) => ApiProduct.fromJson(i)).toList();
      return listProduct;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}


