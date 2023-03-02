import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';
import 'package:dio/dio.dart';

final dio = Dio();

// ignore: non_constant_identifier_names
String BASE_URL = "http://demo32.ninavietnam.com.vn/API/ninasource8v5/api/product_api.php";

List<Product> parse(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<Product> arr = list.map((e) => Product.fromJson(e)).toList();
  return arr;
}

final getProducts = FutureProvider.autoDispose<List<Product>>((ref) async {
  final response = await dio.get(BASE_URL, queryParameters: {'action': 'list'});

  if (response.statusCode == 200) {
    return parse(response.data);
  } else {
    throw Exception('Unexpected error occured!');
  }
});

final AutoDisposeFutureProviderFamily<List<Product>, int> productDetail = FutureProvider.autoDispose.family<List<Product>, int>((ref, id) async {
  final response = await dio.get(BASE_URL, queryParameters: {'action': 'detail', 'id': id});

  if (response.statusCode == 200) {
    return parse(response.data);
  } else {
    throw Exception('Unexpected error occured!');
  }
});
