import 'dart:convert';
import '../models/category.dart';
import 'package:http/http.dart' as http;

Future<List<Category>> fetchCategory() async {
  var url = Uri.parse('https://api.escuelajs.co/api/v1/categories');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return (json.decode(response.body) as List).map((e) => Category.fromJson(e)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
