import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

Future<List<Product>> fetchProduct() async {
  var url = Uri.parse('https://api.escuelajs.co/api/v1/products?offset=0&limit=200');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return (json.decode(response.body) as List).map((e) => Product.fromJson(e)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future<List<Product>> productDetail(int id) async {
  var url = Uri.parse('https://api.escuelajs.co/api/v1/products/$id');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return (json.decode('[${response.body}]') as List).map((e) => Product.fromJson(e)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
