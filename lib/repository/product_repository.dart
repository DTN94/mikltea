import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import '../model/product_model.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) => ProductRepository());

final dio = Dio();
// ignore: non_constant_identifier_names
String BASE_URL = "http://demo32.ninavietnam.com.vn/API/ninasource8v5/api/product_api.php";

class ProductRepository {
  List<ProductModel> parse(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<ProductModel> arr = list.map((e) => ProductModel.fromJson(e)).toList();
    return arr;
  }

  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get(BASE_URL, queryParameters: {'action': 'list'});

    if (response.statusCode == 200) {
      return Future.delayed(const Duration(milliseconds: 300), () {
        return parse(response.data);
      });
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
    final response = await dio.get(BASE_URL, queryParameters: {'action': 'list', 'id': categoryId});

    if (response.statusCode == 200) {
      return Future.delayed(const Duration(milliseconds: 300), () {
        return parse(response.data).where((product) => product.category.id == categoryId).toList();
      });
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<ProductModel> getProduct(int id) async {
    final response = await dio.get(BASE_URL, queryParameters: {'action': 'detail', 'id': id});

    if (response.statusCode == 200) {
      return parse(response.data).first;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
