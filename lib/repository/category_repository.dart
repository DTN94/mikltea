import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

import '../model/category_model.dart';

part 'category_repository.g.dart';

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) => CategoryRepository();

final dio = Dio();
// ignore: non_constant_identifier_names
String BASE_URL = "http://demo32.ninavietnam.com.vn/API/ninasource8v5/api/category_api.php";

class CategoryRepository {
  List<CategoryModel> parse(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<CategoryModel> arr = list.map((e) => CategoryModel.fromJson(e)).toList();
    return arr;
  }

  Future<List<CategoryModel>> getCategories() async {
    final response = await dio.get(BASE_URL, queryParameters: {'action': 'list'});

    if (response.statusCode == 200) {
      return Future.delayed(const Duration(milliseconds: 300), () {
        return parse(response.data);
      });
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<CategoryModel> getCategory(int id) async {
    final response = await dio.get(BASE_URL, queryParameters: {'action': 'detail', 'id': id});

    if (response.statusCode == 200) {
      return Future.delayed(const Duration(milliseconds: 300), () {
        return json.decode(response.data);
      });
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
