import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mikltea/models/product.dart';
import 'package:mikltea/models/category.dart';
import 'package:dio/dio.dart';

final dio = Dio();

// ignore: non_constant_identifier_names
String BASE_URL = "http://demo32.ninavietnam.com.vn/API/ninasource8v5/api/category_api.php";

List<Category> parse(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<Category> arr = list.map((e) => Category.fromJson(e)).toList();
  return arr;
}

final getCategorys = FutureProvider.autoDispose<List<Category>>((ref) async {
  final response = await dio.get(BASE_URL, queryParameters: {'action': 'list'});

  if (response.statusCode == 200) {
    return parse(response.data);
    //return (json.decode(response.data) as List).map((e) => Category.fromJson(e)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
});

final AutoDisposeFutureProviderFamily<List<Category>, String> categoryDetail = FutureProvider.autoDispose.family<List<Category>, String>((ref, id) async {
  final response = await dio.get(BASE_URL, queryParameters: {'action': 'detail', 'id': id});

  if (response.statusCode == 200) {
    return parse('[${response.data}]');
  } else {
    throw Exception('Unexpected error occured!');
  }
});
