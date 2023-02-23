import 'package:dio/dio.dart';
import 'package:mikltea/models/api_product_model.dart';

class ApiConstants {
  static const String BASE_URL = "https://api.escuelajs.co/api/v1/products";

  static Future<List<ApiProduct>> getProduct() async {
    try {
      Response response = await Dio().get(BASE_URL);
      var getUsersData = response.data as List;
      var listProduct = getUsersData.map((i) => ApiProduct.fromJson(i)).toList();
      return listProduct;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  static Future<List<ApiProduct>> getProductDetail(int id) async {
    try {
      Response response = await Dio().get(BASE_URL+"/$id");
      var getUsersData = response.data as List;
      var listProduct = getUsersData.map((i) => ApiProduct.fromJson(i)).toList();
      return listProduct;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}


